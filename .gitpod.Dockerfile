FROM gitpod/workspace-full

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
