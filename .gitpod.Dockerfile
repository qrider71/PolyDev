FROM gitpod/workspace-full

USER root

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.41.0

RUN set -eux; \
    url="https://static.rust-lang.org/rustup/archive/1.21.1/x86_64-unknown-linux-musl/rustup-init"; \
    wget "$url"; \
    echo "0c86d467982bdf5c4b8d844bf8c3f7fc602cc4ac30b29262b8941d6d8b363d7e *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;

RUN curl -sSL https://get.haskellstack.org/ | sh

# Install haskell ide engine dependencies
USER gitpod

RUN sudo apt-get update -q && \
    sudo apt-get install -yq libicu-dev libncurses-dev libgmp-dev && \
    sudo rm -rf /var/lib/apt/lists/*

# istall haskell ide engine 
RUN cd /home/gitpod && \
    echo "cloning https://github.com/haskell/haskell-ide-engine" && \
    git clone https://github.com/haskell/haskell-ide-engine --recursive && \
    cd haskell-ide-engine && \
    echo "stack installing hie-8.6.5" && \
    stack ./install.hs hie-8.6.5 && \
    echo "stack installing data" && \
    stack ./install.hs data && \
    cd /home/gitpod && \
    rm -rf haskell-ide-engine && \
    echo "insalled hie-8.6.5"

# istall haskell hlint
RUN cd /home/gitpod && \
    echo "stack unpacking hlint-2.2.10" && \
    stack unpack hlint-2.2.10 && \
    cd hlint-2.2.10 && \
    echo "stack installing hlint-2.2.10" && \
    stack init && \
    stack build && \
    stack install && \
    cd /home/gitpod && \
    rm -rf hlint-2.2.10 && \
    echo "installed hlint-2.2.10"

# Install Swift dependencies
USER gitpod

RUN sudo apt-get update -q && \
    sudo apt-get install -yq libtinfo5 libcurl4-openssl-dev libncurses5 && \
    sudo rm -rf /var/lib/apt/lists/*

# Install Swift
RUN mkdir -p /home/gitpod/.swift && \
    cd /home/gitpod/.swift && \
    echo "installing SWIFT" && \
    curl -fsSL https://swift.org/builds/swift-5.1-release/ubuntu1804/swift-5.1-RELEASE/swift-5.1-RELEASE-ubuntu18.04.tar.gz | tar -xzv

# Install DotNetCore
USER gitpod
RUN cd /home/gitpod && \
    echo "Installing dotnet-sdk-3.1" && \
    wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb && \
    sudo apt-get update -q && \
    sudo apt-get install -y -o APT::Install-Suggests=“true” apt-transport-https && \
    sudo apt-get update -q && \
    sudo apt-get install -y -o APT::Install-Suggests=“true” dotnet-sdk-3.1 && \
    sudo apt-get update -q && \
    sudo apt-get install -y -o APT::Install-Suggests=“true” aspnetcore-runtime-3.1 && \
    sudo rm -rf /var/lib/apt/lists/*

# Install DotNetCore
USER gitpod
RUN cd /home/gitpod && \
    echo "Installing Scala Dotty" && \
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add  && \
    sudo apt-get update && \
    sudo apt-get install sbt

ENV PATH="$PATH:/home/gitpod/dotty/bin"
ENV PATH="$PATH:/home/gitpod/.swift/swift-5.1-RELEASE-ubuntu18.04/usr/bin"
ENV PATH="$PATH:/home/gitpod/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.5/bin"

USER root

ENV \
    DOTNET_RUNNING_IN_CONTAINER=true \
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    NUGET_XMLDOC_MODE=skip
