#!/usr/bin/env bash

## This is just a big package I did in case I need change distro etc. So in that way it make things easier as go with my studies, rather than install one by one
### 
echo "Installing programming languages"

## Kotlin
curl -s https://get.sdkman.io | bash
sdk install kotlin
sudo apt-get update

## Crystal
curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
curl -sL "https://keybase.io/crystal/pgp_keys.asc" | sudo apt-key add -
echo "deb https://dist.crystal-lang.org/apt crystal main" | sudo tee /etc/apt/sources.list.d/crystal.list
sudo apt-get update
sudo apt-get install crystal

## Fortran
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gfortran-9

## Rust
curl https://sh.rustup.rs -sSf | sh

## Scala
wget www.scala-lang.org/files/archive/scala-2.13.0.deb
sudo dpkg -i scala*.deb

## SBT
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install -y sbt

## Python, C ++, C, Perl, Go and many others
sudo apt-get -y install python3 golang cpp clang perl haskell open-cobol apache2 r-base default-jdk
sudo apt-get -y install build-essential