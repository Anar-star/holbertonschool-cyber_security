#!/bin/bash
sudo nmap --scanflags -p80-90 '$2' stderr stdout '$1'
