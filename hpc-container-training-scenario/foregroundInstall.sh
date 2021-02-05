#!/bin/bash

echo "Waiting background script to complete"; while [ ! -f /opt/.backgroundfinished ] ; do sleep 2; done; echo "Done"


echo "install singularity..."
# Install singualrity
mkdir /downloads
cd /downloads
wget https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz
tar -C /usr/local -zxvf go1.13.7.linux-amd64.tar.gz

#/bin/bash
echo "export GOROOT=/usr/local/go" >> /etc/profile.d/go.sh
echo "export GOPATH=\$GOROOT/work" >> /etc/profile.d/go.sh
echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> /etc/profile.d/go.sh

source /etc/profile.go.sh

env | grep -E "(ROOT|PATH)"
go version

wget https://github.com/singularityware/singularity/releases/download/v3.5.3/singularity-3.5.3.tar.gz
tar -xzvf singularity-3.5.3.tar.gz
cd singularity
./mconfig
make -C ./builddir
make -C ./builddir install
singularity version 
