#!/bin/bash

set -e

TARGET_URL="${APP_URL}"

mkdir -p reports

zap-baseline.py \
  -t "${TARGET_URL}" \
  -n  "/zap/wrk/ZapScripts-Context/IBM-W3ID-Context.context"
 \
  -U "Authenticated User" \
  -j \
  -I \
  -r reports/zap-report.html

echo "Report generated"

ls -l reports
