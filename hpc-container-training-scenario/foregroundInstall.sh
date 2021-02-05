#!/bin/bash
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

go get -u github.com/golang/dep/cmd/dep
go get -d github.com/sylabs/singularity

cd $GOPATH/src/github.com/sylabs/singularity
git fetch
git checkout 
./mconfig
make -C ./builddir
make -C ./builddir install

singularity version 
