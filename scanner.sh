#!/bin/bash

# Default values for variables
ip=""
ports=""

# Parse command-line arguments
while getopts "i:p:" opt; do
  case "$opt" in
    i) ip=$OPTARG;;
    p) ports=$OPTARG;;
    *) echo "Invalid option: -$OPTARG" >&2; exit 1;;
  esac
done

# Check if required options are provided
if [[ -z "$ip" ]]; then
  echo "Please specify an IP address with the -i option" >&2
  exit 1
fi

if [[ -z "$ports" ]]; then
  echo "Please specify a port range with the -p option" >&2
  exit 1
fi

# Scan ports and display open ports
for port in $(seq 1 "$ports"); do
  nc -z -w1 "$ip" "$port" >/dev/null 2>&1 && echo "$ip:$port açık"
done
