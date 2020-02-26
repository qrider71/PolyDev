FROM gitpod/workspace-full

USER root

RUN curl -sSL https://get.haskellstack.org/ | sh

# Install haskell ide engine dependencies
USER gitpod

RUN sudo apt-get update -q && \
    sudo apt-get install -yq apt-utils && \
    sudo apt-get install -yq libicu-dev libncurses-dev libgmp-dev && \
    sudo apt-get install -yq clang libunwind-dev && \
    sudo apt-get install -yq libgc-dev libre2-dev && \
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
    echo "stack unpacking hlint-2.2.11" && \
    stack unpack hlint-2.2.11 && \
    cd hlint-2.2.11 && \
    echo "stack installing hlint-2.2.11" && \
    stack init && \
    stack build && \
    stack install && \
    cd /home/gitpod && \
    rm -rf hlint-2.2.11 && \
    echo "installed hlint-2.2.11"

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

# Install Scala Dotty
USER gitpod
RUN cd /home/gitpod && \
    echo "Installing Scala Dotty" && \
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add  && \
    sudo apt-get update && \
    sudo apt-get install sbt

# Install Rust
USER gitpod
RUN cd /home/gitpod && \
    echo "Installing Rust" && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Kotlin
USER gitpod
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk install kotlin"


# Install Julia
RUN mkdir -p /home/gitpod/.julia && \
    cd /home/gitpod/.julia && \
    echo "installing Julia" && \
    curl -skfL -o julia.tar.gz https://julialang-s3.julialang.org/bin/linux/x64/1.3/julia-1.3.1-linux-x86_64.tar.gz && \
    gzip -d julia.tar.gz && \
    tar -xvf julia.tar

RUN cd /home/gitpod/.julia && \
    rm -rf julia.tar


ENV PATH="$PATH:/home/gitpod/dotty/bin"
ENV PATH="$PATH:/home/gitpod/.swift/swift-5.1-RELEASE-ubuntu18.04/usr/bin"
ENV PATH="$PATH:/home/gitpod/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.5/bin"
ENV PATH="$PATH:/home/gitpod/.julia/julia-1.3.1/bin"

USER root

ENV \
    DOTNET_RUNNING_IN_CONTAINER=true \
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    NUGET_XMLDOC_MODE=skip
