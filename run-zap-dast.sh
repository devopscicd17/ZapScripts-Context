#!/bin/bash

set -ex

TARGET_URL="${APP_URL}"

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
