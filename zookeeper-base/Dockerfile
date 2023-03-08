FROM ubuntu-base

ENV ZOOKEEPER_VERSION=3.7.1 \
	ZOOKEEPER_HOME=/opt/zookeeper

# Download Zookeeper
RUN wget -q http://mirror.vorboss.net/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
	wget -q https://www.apache.org/dist/zookeeper/KEYS && \
	wget -q https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc && \
	wget -q https://www.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512

# Verify download
RUN sha512sum -c apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512 && \
	gpg --import KEYS && \
	gpg --verify apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc

# Install
RUN tar -xzf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz -C /opt 

# Configure
RUN mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/conf/zoo_sample.cfg /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/conf/zoo.cfg ; \
	ln -s /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin ${ZOOKEEPER_HOME} ; \
	sed  -i "s|/tmp/zookeeper|$ZOOKEEPER_HOME/data|g" $ZOOKEEPER_HOME/conf/zoo.cfg; \
	mkdir $ZOOKEEPER_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh

ADD hosts /usr/bin/hosts

VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/data"]

CMD /usr/sbin/sshd && bash /usr/bin/start-zk.sh

EXPOSE 2181 2888 3888