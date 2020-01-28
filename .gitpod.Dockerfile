FROM gitpod/workspace-full
                    
USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/42_config_docker/

USER root
# Install Swift dependencies

RUN touch /etc/MYTEST

RUN apt-get update -q && \
    apt-get install -yq libtinfo5 libcurl4-openssl-dev libncurses5 && \
    rm -rf /var/lib/apt/lists/*

USER gitpod
# Install Swift
RUN mkdir -p /home/gitpod/.swift && \
    cd /home/gitpod/.swift && \
    curl -fsSL https://swift.org/builds/swift-5.1-release/ubuntu1804/swift-5.1-RELEASE/swift-5.1-RELEASE-ubuntu18.04.tar.gz | tar -xzv
ENV PATH="$PATH:/home/gitpod/.swift/swift-5.1-RELEASE-ubuntu18.04/usr/bin"

