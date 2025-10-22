#####################################################################
# Script Name : usages_report.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that generates a report of system resource usage, including CPU, memory, and disk usage.
####################################################################

#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_DIR="/home/kaivalya/shell_task/report_file"
REPORT_FILE="${REPORT_DIR}/system_report_${TIMESTAMP}.txt"

mkdir -p $REPORT_DIR

echo "Generating system resource usage report"
        cpu_usage=$(top -b -n1 | grep "Cpu(s)")
        memory_usage=$(free -h |  grep "Mem")
        disk_usage=$(df -h / | egrep -v "tmpfs")

{
    echo "----------------------------------------"
    echo "System Resource Usage Report"
    echo "Generated on: $(date)"
    echo "----------------------------------------"
    echo ""
    echo "CPU Usage:"
    echo "$cpu_usage"
    echo ""
    echo "Memory Usage:"
    echo "$memory_usage"
    echo ""
    echo "Disk Usage:"
    echo "$disk_usage"
    echo "----------------------------------------"
} > "$REPORT_FILE"

# Display summary
echo "Report saved to: $REPORT_FILE"
echo "----------------------------------------"
echo "CPU Usage: $cpu_usage"
echo "Memory Usage: $memory_usage"
echo "Disk Usage: $disk_usage"
