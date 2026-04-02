#!/bin/bash
sudo nmap -sF -sX -sS --open -Pn '$1'
