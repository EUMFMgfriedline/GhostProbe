#!/bin/bash

# ── LICENSE KEY CHECK ──────────────────────────────────────
LICENSE_KEY="${GHOSTPROBE_LICENSE:-FREE}"
FREE_SCAN_LIMIT=10
SCAN_COUNT_FILE="$HOME/.ghostprobe_scans"

check_license() {
  # Valid Pro keys stored in ~/.ghostprobe_license
  if [[ -f "$HOME/.ghostprobe_license" ]]; then
    STORED_KEY=$(cat "$HOME/.ghostprobe_license")
    if [[ "$STORED_KEY" == "PRO-"* ]]; then
      echo "[✅] Pro License Active — Unlimited scans"
      return 0
    fi
  fi
  echo "[FREE] No Pro license found."
  return 1
}

check_scan_limit() {
  TODAY=$(date +%Y-%m-%d)
  if [[ -f "$SCAN_COUNT_FILE" ]]; then
    FILE_DATE=$(head -1 "$SCAN_COUNT_FILE")
    COUNT=$(tail -1 "$SCAN_COUNT_FILE")
  else
    FILE_DATE=""
    COUNT=0
  fi

  if [[ "$FILE_DATE" != "$TODAY" ]]; then
    echo "$TODAY" > "$SCAN_COUNT_FILE"
    echo "1" >> "$SCAN_COUNT_FILE"
  else
    COUNT=$((COUNT + 1))
    if [[ $COUNT -gt $FREE_SCAN_LIMIT ]]; then
      echo "❌ Free limit reached ($FREE_SCAN_LIMIT scans/day)."
      echo "🔓 Upgrade to Pro: https://eumf.gumroad.com/l/Ghostprobe"
      exit 1
    fi
    sed -i "2s/.*/$COUNT/" "$SCAN_COUNT_FILE"
  fi
}

# ── RUN CHECKS ─────────────────────────────────────────────
if ! check_license; then
  check_scan_limit
fi

#!/bin/bash
target=${1:-hackerone.com}
echo "[GhostProbe v2.0] Scanning $target"

subfinder -d $target -silent > subdomains.txt

nuclei -list subdomains.txt -severity critical,high -j | tee ghostprobe-report.json

rm subdomains.txt
echo "[+] Report: ghostprobe-report.json"
