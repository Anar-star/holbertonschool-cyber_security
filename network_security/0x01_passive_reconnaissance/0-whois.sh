#!/bin/bash
whois "$1" | awk -F: '/^(Registrant|Admin|Tech)/{v=$2;sub(/^ /,"",v);if($1~/Street/)v=v" ";if($1~/Phone Ext|Fax Ext/){print $1":, ";next}print $1", "v}' > "$1.csv"
