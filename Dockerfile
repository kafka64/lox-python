FROM ubuntu:jammy

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install zip sudo unzip build-essential wget git locales ca-certificates python3

RUN sudo useradd -ms /bin/bash vscode && echo "vscode:vscode" | chpasswd && adduser vscode sudo

RUN wget -qO /etc/apt/trusted.gpg.d/dart_linux_signing_key.asc https://dl-ssl.google.com/linux/linux_signing_key.pub

RUN wget -qO /etc/apt/sources.list.d/dart_stable.list https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list

RUN apt-get -y update

RUN apt-get -y install dart

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

USER vscode

