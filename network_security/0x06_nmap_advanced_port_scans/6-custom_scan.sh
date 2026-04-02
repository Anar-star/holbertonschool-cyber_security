#!/bin/bash
sudo nmap --scanflags -p '$2' stderr stdout '$1' > /dev/null
