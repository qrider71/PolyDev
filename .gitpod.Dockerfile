FROM gitpod/workspace-full

USER root

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
    echo "insalled hie-8.6.5"

# istall haskell hlint
RUN cd /home/gitpod && \
    echo "stack unpacking hlint-2.2.9" && \
    stack unpack hlint-2.2.9 && \
    cd hlint-2.2.9 && \
    echo "stack installing hlint-2.2.9" && \
    stack init && \
    stack build && \
    stack install && \
    echo "installed hlint-2.2.9"

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
ENV PATH="$PATH:/home/gitpod/.swift/swift-5.1-RELEASE-ubuntu18.04/usr/bin"
ENV PATH="$PATH:/home/gitpod/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.5/bin"

USER root
