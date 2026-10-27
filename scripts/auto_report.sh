#!/bin/bash
REPORT="../backup/bao-cao-su-co.txt"
LOG="../data/log-he-thong.log"

echo "=== BAO CAO SU CO SMARTFARM ===" > "$REPORT"
echo "Thoi gian: $(date)" >> "$REPORT"
grep -E 'CRITICAL|ERROR' "$LOG" >> "$REPORT"

COUNT=$(grep -Ec 'CRITICAL|ERROR' "$LOG")
echo "TONG SO SU CO: $COUNT" >> "$REPORT"
echo "TONG SO SU CO: $COUNT"