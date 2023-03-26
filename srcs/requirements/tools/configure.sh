#!/bin/bash

if [ ! -d "/home/alazzari/data" ];
then
    mkdir -p /home/alazzari/data/wp_files /home/alazzari/data/wp_db
fi

if [ `cat /etc/hosts | grep alazzari.42.fr | wc -l` -eq 0 ];
then
	echo "127.0.0.1		alazzari.42.fr" | sudo tee -a /etc/hosts
fi