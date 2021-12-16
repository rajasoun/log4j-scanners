#!/usr/bin/env bash

NC=$'\e[0m' # No Color
BOLD=$'\033[1m'
UNDERLINE=$'\033[4m'
RED=$'\e[31m'
GREEN=$'\e[32m'
BLUE=$'\e[34m'
ORANGE=$'\x1B[33m'

echo -e "${BOLD}${UNDERLINE}SBOM Generator & Vulnerability Scanner - v1.0${NC}\n"
echo -e "1. Generating Software Bill of Materials(SBOM) for the Project"
syft packages . -o json > sbom.json
echo -e "2. Scanning Software Bill of Materials(SBOM) for All Vulnerabilities"
grype sbom:sbom.json 

echo -e "3. Scanning Software Bill of Materials(SBOM) for Log4J Vulnerabilities"
grype sbom:sbom.json | grep log4j

if [ $(grype sbom:sbom.json | grep -c log4) != 0 ]; then 
    echo -e "\n ${RED}Vulnerable log4j Found 🔴 ${NC}\n"
else 
    echo -e "\n ${GREEN}Vulnerable log4j NOT Found ✅ ${NC}\n"
fi 

