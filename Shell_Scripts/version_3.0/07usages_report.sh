#####################################################################
# Script Name : usages_report.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that generates a report of system resource usage, including CPU, memory, and disk usage.
####################################################################

#!/bin/bash

REPORT_DIR="/home/kaivalya/shell_task/report_file"
mkdir -p "$REPORT_DIR"
REPORT_FILE="$REPORT_DIR/system_report_$(date +'%Y-%m-%d_%H-%M-%S').txt"

cpu=$(top -bn1 | grep "Cpu(s)")
mem=$(free -h | grep "Mem")
disk=$(df -h / | grep -v "tmpfs")

{
  echo "---- System Resource Report ($(date)) ----"
  echo "CPU: $cpu"
  echo "MEM: $mem"
  echo "DISK:"
  echo "$disk"
} > "$REPORT_FILE"

echo "Report saved: $REPORT_FILE"
