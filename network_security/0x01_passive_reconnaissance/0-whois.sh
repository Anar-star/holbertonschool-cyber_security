#!/bin/bash
whois "$1" | awk -F: > "$1.csv"

