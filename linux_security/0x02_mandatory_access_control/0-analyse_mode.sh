#!/bin/bash
if command -v getenforce >/dev/null 2>&1; then
    mode=$(getenforce)
    echo "SELinux status:                 $mode"
else
    echo "SELinux is not installed on this system."
fi
EOF
