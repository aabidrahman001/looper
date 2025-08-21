#!/bin/bash
set -e
TIMESTAMP_FILE="$(dirname "$0")/last_run_timestamp"
TASK_SCRIPT="$(dirname "$0")/looper.sh"
LOG_FILE="$(dirname "$0")/task.log"

CURRENT_TIME=$(date +%s)
LAST_RUN_TIME=$(cat "$TIMESTAMP_FILE" 2>/dev/null || echo 0)
SECONDS_IN_29_DAYS=$((29 * 24 * 60 * 60))

if (( CURRENT_TIME - LAST_RUN_TIME >= SECONDS_IN_29_DAYS )); then
    echo "$CURRENT_TIME" > "$TIMESTAMP_FILE"
    
    if [[ -x "$TASK_SCRIPT" ]]; then
        "$TASK_SCRIPT"
    else
        echo "Error: Task script ($TASK_SCRIPT) does not exist or is not executable." >&2
        exit 1
    fi
else
    echo "Less than 29 days since last run. Task will not execute."
fi

touch "$LOG_FILE"
echo "Running scheduled checking task at $(date)" >> "$LOG_FILE"

