#!/bin/bash
# A script that reports active, non-commented SSH configuration settings

grep -v '^#' /etc/ssh/sshd_config | grep .
