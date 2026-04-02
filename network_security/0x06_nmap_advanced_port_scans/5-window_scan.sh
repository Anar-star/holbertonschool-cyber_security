#!/bin/bash
sudo nmap -sW -p20, 30 --exclude-ports 25, 30 '3' '$2' '$1'
