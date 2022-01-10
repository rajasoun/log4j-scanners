# Getting Started

Collection of Open Source Tools for Software Bill Material (SBOM )Scan, Static Application Security Testing (SAST) and Dynamic Application Security Testing (DAST)

1. Open Terminal 
2. Go To Project Directory 
3. Ensure Docker is installed

```
 ./scan.sh 
Usage: ./scan.sh  { sbom-scan | sast } 

   sbom-scan <dir> -> Software Bill of Material (SBOM) Scanner 
   sast      <dir> -> Satic Application Security Test 
   dast     <host> -> Dynamic Application Security Test 
```

or 

Execute teh script from github

```
curl -Ls https://raw.githubusercontent.com/rajasoun/log4j-scanners/main/scan.sh | bash
Usage: bash  { sbom-scan | sast | dast } 

   sbom-scan <dir> -> Software Bill of Material (SBOM) Scanner 
   sast      <dir> -> Satic Application Security Test 
   dast     <host> -> Dynamic Application Security Test 
```