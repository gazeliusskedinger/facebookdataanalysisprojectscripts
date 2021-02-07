#!/bin/bash
#Script started on 2021-02-04 03:38:39+00:00 [TERM="linux" TTY="/dev/tty1" COLUMNS="160" LINES="64"]

sudo mount /dev/sda1 /mnt/files
sudo systemctl start mongod
sudo systemctl stop apache2

