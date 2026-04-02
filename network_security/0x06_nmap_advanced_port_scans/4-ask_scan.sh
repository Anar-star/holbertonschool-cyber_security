#!/bin/bash
sudo nmap -sA -p80, 22, 25 "$2" --reason --host-timeout 1000ms "$1"
