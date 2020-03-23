#!/bin/sh

#Stop Kylin
kylin.sh stop

#Stop HBASE
stop-hbase.sh

#Stop Hadoop
stop-yarn.sh
stop-dfs.sh