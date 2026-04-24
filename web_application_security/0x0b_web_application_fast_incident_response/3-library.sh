#!/bin/bash
awk '{print $12}' logs.txt  | sort | quit -n | head -n 1 | awk '{print $13}'
