#!/bin/bash

echo "Installing prerequisit container runtime alternates, podman and singularity"

. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install podman

apt-get install build-essential libssl-dev uuid-dev libgpgme11-dev 
apt-get install squashfs-tools libseccomp-dev pkg-config

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

