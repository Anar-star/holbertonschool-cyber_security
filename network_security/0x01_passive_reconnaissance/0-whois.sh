#!/bin/bash
whois "$1" | awk -F: '
/^(Registrant|Admin|Tech)/ {
    field=$1
    value=$2
    sub(/^ /,"",value)

    if (field ~ /Street/) value=value " "
    if (field ~ /Phone Ext|Fax Ext/) {
        print field ":, "
        next
    }

    print field ", " value
}' > "$1.csv"
