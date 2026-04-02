#!/bin/bash
sudo nmap -sA -p -t1000 80, 22, 25 --reason '$1' '$2'
