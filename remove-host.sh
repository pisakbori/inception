#!/bin/bash

# Check if the domain exists in /etc/hosts, and if so, remove it
if grep -q "${DOMAIN}" "/etc/hosts"; then
    sudo sed -i.bak "/${DOMAIN}/d" /etc/hosts
    echo "Removed ${DOMAIN} from /etc/hosts"
else
    echo "${DOMAIN} not found in /etc/hosts"
fi