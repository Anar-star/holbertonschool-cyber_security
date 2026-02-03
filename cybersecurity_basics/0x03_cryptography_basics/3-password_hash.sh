#!/bin/bash
SALT=$(openssl rand -base64 12 | cut -c1-16) | echo -n "$1$SALT" | openssl dgst -sha512 > 3_hash.txt
