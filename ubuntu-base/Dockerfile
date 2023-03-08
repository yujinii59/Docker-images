FROM ubuntu:latest
RUN apt-get update -y; apt-get install -y unzip openjdk-11-jdk wget supervisor docker.io openssh-server gpg vim
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-arm64/
RUN mkdir /var/run/sshd

EXPOSE 22