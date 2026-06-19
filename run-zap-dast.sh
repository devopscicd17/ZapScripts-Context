#!/bin/bash

set -ex

TARGET_URL="https://doc-enrich-frontend-document-enrichment.ae-sap-cluster-test-2322d3421b77f2abeee72f9925acd471-0000.us-south.containers.appdomain.cloud/?teamId=667d2995f046a740e049d6e0&teamName=SAP%20And%20Friends&instance=staging&suite=Delivery"

echo "================================"
echo "Target URL: ${TARGET_URL}"
echo "================================"

mkdir -p reports

echo "Repository Contents"
find /zap/wrk/ZapScripts-Context

echo "Testing Context File"
ls -l "/zap/wrk/ZapScripts-Context/IBM-W3ID-Context.context"

zap-baseline.py \
  -t "${TARGET_URL}" \
  -n "/zap/wrk/ZapScripts-Context/IBM-W3ID-Context.context" \
  -j \
  -I \
  -r reports/zap-report.html

echo "================================"
echo "Report generated"
echo "================================"

ls -lh reports
