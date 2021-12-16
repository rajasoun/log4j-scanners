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

echo -e "${BOLD}${UNDERLINE}SBOM Generator & Vulnerability Scanner - v1.0${NC}\n"
[ $(git rev-parse --is-inside-work-tree) ] || raise_eeror "Not a Git Repository"
repo_name=$(git ls-remote --get-url)
echo -e "${BOLD}${ORANGE}Git Repository : ${NC}$repo_name\n"
echo -e "1. Generating Software Bill of Materials(SBOM) for the Project"
syft packages . -o json > sbom.json
echo -e "2. Scanning Software Bill of Materials(SBOM) for All Vulnerabilities/n"
grype sbom:sbom.json 

echo -e "\n3. Scanning Software Bill of Materials(SBOM) for Log4J Vulnerabilities"
grype sbom:sbom.json | grep log4j

if [ $(grype sbom:sbom.json | grep -c log4) != 0 ]; then 
    echo -e "\n ${RED}Vulnerable log4j Found 🔴 ${NC}\n"
else 
    echo -e "\n ${GREEN}Vulnerable log4j NOT Found ✅ ${NC}\n"
fi 

