#!/usr/bin/env bash

echo -e "Generating Software Bill of Materials(SBOM) for the Project"
syft packages . -o json > sbom.json
echo -e "Scanning Software Bill of Materials(SBOM) for All Vulnerabilities"
grype sbom:sbom.json 

echo -e "Scanning Software Bill of Materials(SBOM) for Log4J Vulnerabilities"
grype sbom:sbom.json | grep log4j

if [ $(grype sbom:sbom.json | grep -c log4) != 0 ]; then 
    echo -e "\n Vulnerable log4j Found 🔴 \n"
else 
    echo -e "\n Vulnerable log4j NOT Found ✅ \n"
fi 

