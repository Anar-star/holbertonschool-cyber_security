#!/bin/bash
ps -u "$1" -o pid,user,vsz,rss,comm | grep -vE ' 0 +0 '
