#!/bin/bash
sudo nmap -sM -p ttp, https, ftp, ssh, telnet -vv '$1'
