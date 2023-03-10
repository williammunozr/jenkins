FROM jenkins/ssh-agent:latest-jdk11
USER root
RUN apt-get update \
    && apt-get --yes --no-install-recommends install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git

# setup Docker
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && chmod a+r /etc/apt/keyrings/docker.gpg

RUN apt-get update \
    && apt-get --yes --no-install-recommends install docker-ce-cli docker-scan-plugin \
    && apt-get clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

USER jenkins
