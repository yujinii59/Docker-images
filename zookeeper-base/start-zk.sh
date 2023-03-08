#!/bin/bash -e

sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZOOKEEPER_HOME/conf/log4j.properties
sed -i -r 's|#autopurge|autopurge|g' $ZOOKEEPER_HOME/conf/zoo.cfg

if [[ -z "$ZOO_MY_ID" ]]; then
	export ZOO_MY_ID=$(echo $(hostname) | sed "s|[^0-9]||g")
fi

if [[ -z "$ZOO_SERVERS" ]]; then
	export ZOO_SERVERS=""
fi


echo $ZOO_MY_ID > $ZOOKEEPER_HOME/data/myid

echo $ZOO_SERVERS | sed "s|;2181|\n|g" | sed "s| ||g" >> $ZOOKEEPER_HOME/conf/zoo.cfg


/opt/zookeeper/bin/zkServer.sh start-foreground
