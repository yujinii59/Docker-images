FROM ubuntu:latest
RUN apt-get update -y; apt-get install -y unzip openjdk-11-jdk wget curl supervisor docker.io openssh-server vim systemctl

# Install schema-registry
RUN wget -q http://packages.confluent.io/archive/6.1/confluent-community-6.1.0.tar.gz -O /opt/confluent-community-6.1.0.tar.gz && \
	tar -zxf /opt/confluent-community-6.1.0.tar.gz -C /usr/local/ && \
	ln -s /usr/local/confluent-6.1.0 /usr/local/confluent

ADD schema-registry.service /etc/systemd/system/schema-registry.service

ADD start-registry.sh /usr/bin/start-registry.sh

RUN chmod +x /usr/bin/start-registry.sh

CMD /usr/bin/start-registry.sh

