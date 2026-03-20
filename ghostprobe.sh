#!/bin/bash
TARGET=$1
subfinder -d $TARGET -all -o subdomains.txt
cat subdomains.txt | httpx -silent > live.txt
nuclei -l live.txt -severity high,critical -je report.json -c 50
jq '.[] | select(.info.severity=="high")' report.json > high-risk.json
echo "GhostProbe complete: $TARGET"
