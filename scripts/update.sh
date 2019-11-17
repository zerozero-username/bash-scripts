#!/usr/bin/env bash

printf "%s\n\n" "It's recommended a reboot after this"

printf "%s\n\n" "Updating!"

sudo -i

apt-get update

apt-get upgrade

apt-get update

apt-get dist-upgrade

apt-get update

exit

