#shell script that generates a report of system resource usage, including CPU, memory, and disk usage.

#!/bin/bash

report_file="/home/kaivalya/shell_task/report_file/system_report_$(date).txt"

echo "Generating system resource usage report"
	cpu_usage=$(top -b -n1 | grep "Cpu(s)") >> "$report_file"
	memory_usage=$(free -h |  grep "Mem") >> "$report_file"
	disk_usage=$(df -h / | egrep -v "tmpfs") >> "$report_file"

echo "Report saved to $report_file"
echo "CPU Usage: $cpu_usage"
echo "Memory Usage: $memory_usage"
echo "Disk Usage: $disk_usage"
