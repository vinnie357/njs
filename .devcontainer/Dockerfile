# based on microsoft codespaces containers thank you!
# [Choice] Ubuntu version: bionic, focal

FROM vinnie357/f5-devops-base:latest

ENV USERNAME="f5-devops" \
    USER_UID=1000 \
    USER_GID=$USER_UID \
    SHELL="/bin/bash" \
    GOROOT="/usr/local/go" \
    GOPATH="/go" \
    GOVERSION="1.15.6" \
    PRECOMMITVERSION="latest" \
    TERRAFORMVERSION="0.14.0" \
    TERRAFORMDOCSVERSION="0.9.1" \
    ANSIBLEVERSION="2.10.5" \
    VESCTL_VERSION="0.2.15" \
    NODE_VERSION="v14.16.0" \
    #NODE_VERSION="lts/*" \
    NVM_DIR="/usr/local/share/nvm"

COPY scripts/* /tmp/scripts/
# switch back to root for installs
USER root
# add extras
RUN set -ex \
    && apt-get update \
    && bash /tmp/scripts/pre-commit-debian.sh \
    && bash /tmp/scripts/docker-debian.sh "true" "/var/run/docker-host.sock" "/var/run/docker.sock" "${USERNAME}" "true" \
    && bash /tmp/scripts/go-debian.sh "${GOVERSION}" "${GOROOT}" "${GOPATH}" "${USERNAME}" "true" "false"

# Clean up
RUN set -ex \
&& apt autoremove -y && apt clean -y

#change user
USER ${USERNAME}
