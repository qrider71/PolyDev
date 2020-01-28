FROM gitpod/workspace-full:latest

USER gitpod
# Apply user-specific settings

RUN mkdir -p /home/gitpod/.swift 

# Give back control
USER root