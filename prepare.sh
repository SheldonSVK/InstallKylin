#!/bin/sh

#update repositories
echo "update repositories"
sudo apt-get -qq update

#Vertification, install and settings ssh localhost
echo "check ssh"
if type -p ssh; then
    echo "ssh is installed!"
else
    echo ssh is not installed, ssh will be installed.
    sudo apt -qq --yes --force-yes install ssh
    if (type -p ssh); then
        echo ssh successfully installed
    else
        echo ssh not successfully installed
        exit
    fi
fi

ssh-keygen -t rsa -b 4096
ssh-copy-id localhost

#Vertification and install pdsh
echo "chceck pdsh"
if type -p pdsh; then
    echo "pdsh is installed!"
else
    echo pdsh is not installed, pdsh will be installed.
    sudo apt -qq --yes --force-yes install pdsh
    if (type -p pdsh); then
        echo pdsh successfully installed
    else
        echo pdsh not successfully installed
        exit
    fi
fi

# Vertification and install openjdk 1.8
if !(type -p java); then
    echo java is not installed, openjdk 1.8 will be installed.
    sudo apt -qq --yes --force-yes install openjdk-8-jdk
    if (type -p java); then
        echo java 1.8 successfully installed
    else
        echo java 1.8 not successfully installed
        exit
    fi
fi

#Vertification and settings $JAVA_HOME
if [[ -n "$JAVA_HOME" ]]; then
    echo JAVA_HOME successfully find
    
else
    echo JAVA_HOME not find
    if [[ -d /usr/lib/jvm/java-1.8.0-openjdk-amd64 ]]; then
        echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >>~/.bashrc
        echo 'export PATH=$JAVA_HOME/bin:$PATH' >>~/.bashrc
        echo "JAVA_HOME set"
    else
        echo "Error: The java 1.8 installation folder is missing."
        exit 
    fi
fi

echo 'Setup complete, please run install.sh'