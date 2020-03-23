#!/bin/sh

#Start Hadoop
start-dfs.sh
start-yarn.sh

#Start HBASE
start-hbase.sh

#Start Kylin
kylin.sh start