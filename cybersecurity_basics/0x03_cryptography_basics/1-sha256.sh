#!/bin/bash
# This script hashes the first argument using sha256sum
echo -n "$1" | sha256sum | awk '{print $1}' > 1_hash.txt
