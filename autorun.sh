#!/bin/bash
echo "
    _         _                         
   / \  _   _| |_ ___  _ __ _   _ _ __  
  / _ \| | | | __/ _ \| '__| | | | '_ \ 
 / ___ \ |_| | || (_) | |  | |_| | | | |
/_/   \_\__,_|\__\___/|_|   \__,_|_| |_|
"


set -e
set -o pipefail

CHECK_AND_RUN_SCRIPT="$(dirname "$0")/check.sh"
DAILY_CRON_SCHEDULE="0 0 * * *"

TMP_CRON_FILE=$(mktemp)
if [[ ! -f "$TMP_CRON_FILE" ]]; then
    echo "Failed to create temporary file." >&2
    exit 1
fi

crontab -l > "$TMP_CRON_FILE" 2>/dev/null || true

if grep -Fq "$CHECK_AND_RUN_SCRIPT" "$TMP_CRON_FILE"; then
    echo "Autorun schedule already exists."
else
    echo "$DAILY_CRON_SCHEDULE $CHECK_AND_RUN_SCRIPT" >> "$TMP_CRON_FILE"
    echo "@reboot $CHECK_AND_RUN_SCRIPT" >> "$TMP_CRON_FILE"
    crontab "$TMP_CRON_FILE"
    echo "Autorun schedule successfully initialized"
fi

rm "$TMP_CRON_FILE"
$CHECK_AND_RUN_SCRIPT
LOG_FILE="$(dirname "$0")/task.log"
echo "Running autorun-install task at $(date)" >> "$LOG_FILE"

