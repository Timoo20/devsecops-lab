#!/bin/bash
# log-collector.sh
# Centralized Security Log Collector for DevSecOps Lab
# ----------------------------------------------------
# Purpose:
#   Collect logs from vulnerable apps (DVWA, Juice Shop, WebGoat, Mutillidae)
#   and prepare them for ingestion into Wazuh, Elastic, or Splunk.
#
# Features:
#   - Aggregates logs from multiple apps
#   - Normalizes timestamps
#   - Compresses and archives logs
#   - Ships logs to /var/log/security-lab
#
# Usage:
#   ./log-collector.sh
# ----------------------------------------------------

SRC_DIRS=(
  "/opt/juice-shop/logs"
  "/opt/dvwa/logs"
  "/opt/mutillidae/logs"
  "/opt/webgoat/logs"
)
DEST_DIR="/var/log/security-lab"
mkdir -p "$DEST_DIR"

NORMALIZED="$DEST_DIR/normalized.log"
> "$NORMALIZED"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log "Collecting logs from all sources..."

for DIR in "${SRC_DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    for FILE in "$DIR"/*.log; do
      [ -e "$FILE" ] || continue
      awk '{print strftime("%Y-%m-%d %H:%M:%S"), $0}' "$FILE" >> "$NORMALIZED"
    done
  fi
done

log "Normalizing and compressing logs..."
tar -czf "$DEST_DIR/$(date '+%Y%m%d')-security-logs.tar.gz" "$NORMALIZED"

log "Log collection completed. Output stored in $DEST_DIR"
