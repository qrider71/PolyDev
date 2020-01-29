FROM gitpod/workspace-full

USER root

RUN curl -sSL https://get.haskellstack.org/ | sh

USER gitpod

# Install haskell ide engine dependencies
RUN sudo apt-get update -q && \
    sudo apt-get install -yq libicu-dev libncurses-dev libgmp-dev && \
    sudo rm -rf /var/lib/apt/lists/*

# istall haskell ide engine 
RUN cd /home/gitpod && \
    git clone https://github.com/haskell/haskell-ide-engine --recursive && \
    cd haskell-ide-engine && \
    stack install && \
    stack ./install.hs hie-8.6.5 && \
    stack ./install.hs data

USER gitpod

# Install Swift dependencies
RUN sudo apt-get update -q && \
    sudo apt-get install -yq libtinfo5 libcurl4-openssl-dev libncurses5 && \
    sudo rm -rf /var/lib/apt/lists/*

# Install Swift
RUN mkdir -p /home/gitpod/.swift && \
    cd /home/gitpod/.swift && \
    curl -fsSL https://swift.org/builds/swift-5.1-release/ubuntu1804/swift-5.1-RELEASE/swift-5.1-RELEASE-ubuntu18.04.tar.gz | tar -xzv
ENV PATH="$PATH:/home/gitpod/.swift/swift-5.1-RELEASE-ubuntu18.04/usr/bin"
ENV PATH="$PATH:/home/gitpod/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.5/bin"

