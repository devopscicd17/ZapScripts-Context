#!/bin/bash

set -ex

git clone https://github.com/devopscicd17/ZapScripts-Context.git

TARGET_URL="https://doc-enrich-frontend-document-enrichment.ae-sap-cluster-test-2322d3421b77f2abeee72f9925acd471-0000.us-south.containers.appdomain.cloud/"

mkdir -p reports

echo "Testing connectivity..."

curl -I "$TARGET_URL" || true

zap-baseline.py \
    -t "$TARGET_URL" \
    -j \
    -I \
    -d \
    -r reports/zap-report.html

ls -lh reports
