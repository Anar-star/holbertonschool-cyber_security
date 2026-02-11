#!/bin/bash
grep -v '^#' /etc/postfix/main.cf | grep -q "smtpd_tls_security_level" && grep -v '^#' /etc/postfix/main.cf | grep "smtpd_tls_security_level" || echo "STARTTLS not configured"
