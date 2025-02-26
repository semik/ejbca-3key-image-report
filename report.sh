#!/bin/bash

BASE=harbor.3key.company/ejbca-3key/ejbca-3key
for TAG in 9.2.0-1.0.5-nshield-12.81.2 ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5 ejbca-9.2.0-wildfly-35.0.0-semik4-13.6.5-HOTFIX
do
    echo "# $BASE:$TAG"
    trivy --cache-dir /tmp/trivy image "$BASE:$TAG" >reports/$TAG.txt 2>&1
    trivy --cache-dir /tmp/trivy image "$BASE:$TAG" --format=json >reports/$TAG.json 2>&1
    echo '```'
    cat reports/$TAG.txt | grep -B1 -A1 ===
    echo '```'
    echo ""


done