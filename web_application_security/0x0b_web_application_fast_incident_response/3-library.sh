#!/bin/bash
awk '{print $12}' | sort | quit -n | head -n 1 | awk '{print $13}'
