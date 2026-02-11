#!/bin/bash
getenforce | awk '{print "SELinux status:                 "$1}'
