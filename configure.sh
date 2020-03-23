#!/bin/sh

#HDFS Namenode
hdfs namenode -format

#Start Hadoop
start-dfs.sh
start-yarn.sh

#Create user for Hive
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -mkdir /tmp

#Change permission
hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfs -chmod g+w /tmp

#Create scheme
schematool -initSchema -dbType derby

#Start HBASE
start-hbase.sh

#Start Kylin
kylin.sh start
