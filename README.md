# InstallKylin
 Install and configure Kylin

# Instruction

1. Copy files to the user 's home folder
    - prepare.sh
    - install.sh
    - configure.sh 
    - and full folder tmp

2. bash prepare.sh (not as root!!)
    - Update repositories
    - Vertification, install and settings ssh localhost
    - Vertification and install pdsh
    - Vertification and install openjdk 1.8

3. sudo bash install.sh
    - Download and config Hadoop 2.10.0
    - Download and config HIVE 2.3.7
    - Download and config HBASE 1.4.13
    - Download and config Kylin 2.6.5
    - Run Kylin script download-spark.sh
    
4. bash configure.sh
    - HDFS Namenode
    - Start Hadoop
    - Create user for Hive
    - Create scheme
    - Start HBASE
    - Start Kylin
    
# Start and stop Kylin

- To start, run these commands one by one
    1. start-dfs.sh
    2. start-yarn.sh
    3. start-hbase.sh
    4. kylin.sh start
    
- To stop, run these commands one by one
    1. kylin.sh stop
    2. stop-hbase.sh
    3. stop-yarn.sh
    4. stop-dfs.sh
    
Optional
copy startKylin.sh and stopKylin.sh files for faster startup and shutdown
