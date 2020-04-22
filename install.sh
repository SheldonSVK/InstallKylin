#!/bin/sh

# Set ubuntu
sudo echo "127.0.0.1 ubuntu" >> /etc/hosts 

# Download and unpac Hadoop 2.10.0
wget https://downloads.apache.org/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz
tar xzf hadoop-2.10.0.tar.gz
mv hadoop-2.10.0 hadoop
rm hadoop-2.10.0.tar.gz
sed -i "/home_dir/c\<value>$HOME/hdata</value>" tmp/core-site.xml
mv tmp/core-site.xml hadoop/etc/hadoop/
mv tmp/hdfs-site.xml hadoop/etc/hadoop/
mv tmp/mapred-site.xml hadoop/etc/hadoop/
mv tmp/yarn-site.xml hadoop/etc/hadoop/
mv tmp/hadoop-env.sh hadoop/etc/hadoop/
sudo chmod 777 -R hadoop/

# Set HADOOP_HOME
echo "export HADOOP_HOME=$HOME/hadoop" >>~/.bashrc
echo 'export HADOOP_INSTALL=$HADOOP_HOME' >>~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >>~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >>~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >>~/.bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >>~/.bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native' >>~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin' >>~/.bashrc
echo 'export HADOOP_PREFIX=$HADOOP_HOME' >>~/.bashrc

# Download and unpac HIVE 2.3.7
wget https://downloads.apache.org/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz
tar xzf apache-hive-2.3.7-bin.tar.gz
mv apache-hive-2.3.7-bin hive
rm apache-hive-2.3.7-bin.tar.gz

# Configure HIVE
cp hive/conf/hive-env.sh.template hive/conf/hive-env.sh
echo "export HADOOP_HOME=$HOME/hadoop" >> hive/conf/hive-env.sh
echo "export HADOOP_HEAPSIZE=512" >> hive/conf/hive-env.sh
echo "export HIVE_CONF_DIR=$HOME/hive/conf" >> hive/conf/hive-env.sh
sed -i "/home_dir/c\<value>jdbc:derby:;databaseName=$HOME/hive/metastore_db;create=true</value>" tmp/hive-site.xml
mv tmp/hive-site.xml hive/conf/

sudo chmod 777 -R hive/

# Set HIVE_HOME
echo "export HIVE_HOME=$HOME/hive" >>~/.bashrc
echo 'export PATH=$PATH:$HIVE_HOME/bin' >>~/.bashrc

# Download and unpac HBASE 1.4.13
wget https://downloads.apache.org/hbase/1.4.13/hbase-1.4.13-bin.tar.gz
tar xzf hbase-1.4.13-bin.tar.gz
mv hbase-1.4.13 hbase
rm hbase-1.4.13-bin.tar.gz
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >> hbase/conf/hbase-env.sh
sed -i "/home_dir/c\<value>$HOME/zookeeper</value>" tmp/hbase-site.xml
mv tmp/hbase-site.xml hbase/conf/
sudo chmod 777 -R hbase/ 

# Set HBASE_HOME
echo "export HBASE_HOME=$HOME/hbase" >>~/.bashrc
echo 'export PATH=$PATH:$HBASE_HOME/bin' >>~/.bashrc

# Download and unpac Kylin 2.6.5
wget https://archive.apache.org/dist/kylin/apache-kylin-2.6.5/apache-kylin-2.6.5-bin-hbase1x.tar.gz
tar xzf apache-kylin-2.6.5-bin-hbase1x.tar.gz
mv apache-kylin-2.6.5-bin-hbase1x kylin
rm apache-kylin-2.6.5-bin-hbase1x.tar.gz
sudo chmod 777 -R kylin/

# Set KYLIN_HOME
echo "export KYLIN_HOME=$HOME/kylin" >>~/.bashrc
echo 'export PATH=$PATH:$KYLIN_HOME/bin' >>~/.bashrc


#Download and install Spark
$HOME/kylin/bin/download-spark.sh

#End

rm -r tmp
printf "Installation completed, please reboot\n" 