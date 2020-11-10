FROM jenkins/jenkins:2.266-slim

# jenkins image runs as jenkins user and not root so elevate
USER root
# install docker
RUN apt-get update && \
    apt-get -y install apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        zip \
        unzip \
        nano \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" && \
    apt-get update && \
    apt-get -y install docker-ce && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/* && \
    apt-get clean && \
    apt-get autoclean
# add jenkins to docker group so we can run docker commands without sudo
RUN usermod -a -G docker jenkins
# run the new image as a non-root jenkins user
USER jenkins
