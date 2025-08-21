#!/bin/bash

echo "Removing Autorun scheduler..."

CHECK_AND_RUN_SCRIPT="$(dirname "$0")/check.sh"
TMP_CRON_FILE=$(mktemp -t cronfile.XXXXXX)

if [ $? -ne 0 ]; then
    echo "Failed to create temporary file."
    exit 1
fi

crontab -l > "$TMP_CRON_FILE" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Failed to list current autorun schedule. It may be empty or inaccessible."
    rm "$TMP_CRON_FILE"
    exit 1
fi

sed -i "\|$CHECK_AND_RUN_SCRIPT|d" "$TMP_CRON_FILE"

if cmp -s "$TMP_CRON_FILE" <(crontab -l 2>/dev/null); then
    echo "No autorun schedule found for $CHECK_AND_RUN_SCRIPT."
    rm "$TMP_CRON_FILE"
    exit 0
fi

crontab "$TMP_CRON_FILE"
if [ $? -ne 0 ]; then
    echo "Failed to update crontab."
    rm "$TMP_CRON_FILE"
    exit 1
fi

echo "Autorun schedule succesfully removed for $CHECK_AND_RUN_SCRIPT."

rm "$TMP_CRON_FILE"

LOG_FILE="$(dirname "$0")/task.log"
echo "Running uninstall-autorun task at $(date)" >> "$LOG_FILE"

