#! /bin/bash

printf "%s\n\n" "Warning! This is a quick fix for net issues with resolvconf"
sleep 0.1

printf "%s\n\n" "Mostly for when services (like certain vpn's....) mess up with the resolv.conf file"
sleep 0.1

printf "%s\n\n" "Use with caution!"
sleep 0.3

printf "%s\n\n" "Starting quick net-fix"
sleep 0.1
printf "%s\n\n" "Removing resolv.conf from /etc/resolv.conf"

sudo rm /etc/resolv.conf

sleep 0.1
printf "%s\n\n" "Copying resolv.conf from /var/run/NetworkManager/resolv.conf to /etc/resolv.conf"
sudo ln -s /var/run/NetworkManager/resolv.conf /etc/resolv.conf

sleep 0.1
printf "%s\n\n" "Updating resolvconf service"
sudo resolvconf -u