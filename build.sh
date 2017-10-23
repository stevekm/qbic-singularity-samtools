#!/bin/bash
#This is required to build the stuff

set -euo pipefail

SAMTOOLS_VERSION=1.6

#Add here what kind of dependencies you need in general
#Check for packages here: https://pkgs.alpinelinux.org/packages
apk --update add bash wget ca-certificates zlib-dev libbz2 bzip2-dev xz-dev xz-libs build-base ncurses ncurses-dev
mkdir /build
cd /build
wget https://github.com/samtools/samtools/releases/download/$SAMTOOLS_VERSION/samtools-$SAMTOOLS_VERSION.tar.bz2
tar jxf samtools-$SAMTOOLS_VERSION.tar.bz2
cd samtools-$SAMTOOLS_VERSION
make 
make install prefix=/usr
#Run the installation here or in the Singularity file itself, no matter which one 

#Clean up
rm -rf /var/cache/apk/*

cd /
rm -rf /build
