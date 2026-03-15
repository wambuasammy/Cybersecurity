#!/bin/bash

# ======================================================
# Linux Security Audit Framework
# ======================================================

# ======================================================
# Tool Metadata (NEW FEATURE)
# ======================================================

TOOL_NAME="Linux Security Audit Framework"
VERSION="1.0"
AUTHOR="Sammy Wambua"

start_time=$(date +%s)

echo "===================================================="
echo " $TOOL_NAME"
echo " Version: $VERSION"
echo " Author: $AUTHOR"
echo "===================================================="
echo ""
echo "Scan started: $(date)"
echo ""

# ======================================================
# Prepare Report Directory
# ======================================================

mkdir -p reports

report_txt="reports/audit_$(date +%F).txt"
report_csv="reports/audit_$(date +%F).csv"

VERBOSE=false

security_score=100
warning_count=0
critical_count=0

echo "Timestamp,Module,Check,Result,Status" > "$report_csv"

printf "%-20s | %-25s | %-40s | %-10s\n" "MODULE" "CHECK" "RESULT" "STATUS" > "$report_txt"
printf "%-20s | %-25s | %-40s | %-10s\n" "------" "-----" "------" "------" >> "$report_txt"

# ======================================================
# COLORS
# ======================================================

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# ======================================================
# Logging Function
# ======================================================

log_result(){

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

module=$1
check=$2
result=$3
status=$4

echo "$timestamp,$module,$check,$result,$status" >> "$report_csv"

printf "%-20s | %-25s | %-40s | %-10s\n" \
"$module" "$check" "$result" "$status" >> "$report_txt"

case $status in

INFO)
echo -e "${BLUE}[INFO]${NC} $check → $result"
;;

OK)
echo -e "${GREEN}[OK]${NC} $check → $result"
;;

WARNING)
echo -e "${YELLOW}[WARNING]${NC} $check → $result"
((warning_count++))
((security_score-=5))
;;

CRITICAL)
echo -e "${RED}[CRITICAL]${NC} $check → $result"
((critical_count++))
((security_score-=20))
;;

esac

}

# ======================================================
# Dependency Check
# ======================================================

check_dependencies(){

required_tools=("hostname" "ps" "ip" "ping" "awk" "grep" "cut" "tr")

for tool in "${required_tools[@]}"
do

if ! command -v $tool >/dev/null 2>&1
then
echo -e "${YELLOW}[WARNING] Missing dependency: $tool${NC}"
fi

done

}

# ======================================================
# Load Modules
# ======================================================

source modules/system_info.sh
source modules/users_enum.sh
source modules/process_enum.sh
source modules/network_enum.sh
source modules/connectivity_tests.sh
source modules/security_checks.sh
source modules/login_analysis.sh
source modules/threat_detection.sh

# ======================================================
# Security Summary
# ======================================================

security_summary(){

echo ""
echo "===================================="
echo "SYSTEM SECURITY SUMMARY"
echo "===================================="

echo "Warnings: $warning_count"
echo "Critical Findings: $critical_count"
echo "Security Score: $security_score / 100"

if [ $security_score -ge 90 ]
then
risk="LOW"

elif [ $security_score -ge 70 ]
then
risk="MEDIUM"

else
risk="HIGH"

fi

echo "Risk Level: $risk"

}

# ======================================================
# Full Scan
# ======================================================

full_scan(){

echo "[+] Checking dependencies..."
check_dependencies

echo "[+] Starting Linux Security Audit"

system_info
users_enum
process_enum
network_enum
connectivity_tests
security_checks
login_analysis
threat_detection

echo ""

end_time=$(date +%s)
duration=$((end_time - start_time))

echo "------------------------------------"
echo "Scan completed in $duration seconds"
echo "Reports saved in ./reports"
echo "------------------------------------"

security_summary

}

# ======================================================
# Help Menu
# ======================================================

show_help(){

echo ""
echo "Linux Security Audit Framework"
echo ""
echo "Usage:"
echo "./linux_audit.sh [OPTION]"
echo ""
echo "Options:"
echo "  --scan       Run full system audit"
echo "  --system     System information scan"
echo "  --users      User enumeration"
echo "  --process    Process analysis"
echo "  --network    Network enumeration"
echo "  --connect    Connectivity tests"
echo "  --security   Security checks"
echo "  --logins     Login analysis"
echo "  --threats    Threat detection"
echo "  --verbose    Enable verbose output"
echo "  --help       Show help menu"
echo ""

}

# ======================================================
# CLI Argument Handling
# ======================================================

case $1 in

--scan)
full_scan
;;

--system)
check_dependencies
system_info
security_summary
;;

--users)
check_dependencies
users_enum
security_summary
;;

--process)
check_dependencies
process_enum
security_summary
;;

--network)
check_dependencies
network_enum
security_summary
;;

--connect)
check_dependencies
connectivity_tests
security_summary
;;

--security)
check_dependencies
security_checks
security_summary
;;

--logins)
check_dependencies
login_analysis
security_summary
;;

--threats)
check_dependencies
threat_detection
security_summary
;;

--verbose)
VERBOSE=true
full_scan
;;

--help)
show_help
;;

*)
show_help
;;

esac