#!/bin/bash

# ==========================================
# Linux Security Enumeration Toolkit
# ==========================================

GREEN="\e[32m"
RED="\e[31m"
BLUE="\e[34m"
YELLOW="\e[33m"
RESET="\e[0m"

timestamp=$(date +"%Y-%m-%d_%H-%M")
report="system_audit_$timestamp.txt"

# -----------------------------------------
# Banner
# -----------------------------------------

clear
echo -e "${BLUE}"
echo "==========================================="
echo "      Linux Security Enumeration Tool"
echo "==========================================="
echo -e "${RESET}"

echo "Report: $report"

echo "==========================================" > $report
echo "        LINUX SECURITY AUDIT REPORT" >> $report
echo "==========================================" >> $report
echo "Generated: $(date)" >> $report
echo "" >> $report

# -----------------------------------------
# SYSTEM INFORMATION
# -----------------------------------------

system_info(){

echo -e "${YELLOW}[+] Collecting system information...${RESET}"

echo "=== SYSTEM INFORMATION ===" >> $report
hostname >> $report
whoami >> $report
uname -a >> $report
cat /etc/os-release >> $report
echo "" >> $report
}

# -----------------------------------------
# USER ENUMERATION
# -----------------------------------------

users_enum(){

echo -e "${YELLOW}[+] Enumerating users...${RESET}"

echo "=== USER ENUMERATION ===" >> $report

echo "Current user identity:" >> $report
id >> $report
echo "" >> $report

echo "Logged in users:" >> $report
who >> $report
echo "" >> $report

echo "System users:" >> $report
cut -d: -f1 /etc/passwd >> $report
echo "" >> $report

echo "Groups:" >> $report
cut -d: -f1 /etc/group >> $report
echo "" >> $report
}

# -----------------------------------------
# PROCESS ANALYSIS
# -----------------------------------------

process_enum(){

echo -e "${YELLOW}[+] Inspecting running processes...${RESET}"

echo "=== PROCESS ANALYSIS ===" >> $report

echo "Top CPU processes:" >> $report
ps aux --sort=-%cpu | head -n 10 >> $report
echo "" >> $report

echo "Top memory processes:" >> $report
ps aux --sort=-%mem | head -n 10 >> $report
echo "" >> $report
}

# -----------------------------------------
# NETWORK ENUMERATION
# -----------------------------------------

network_enum(){

echo -e "${YELLOW}[+] Collecting network configuration...${RESET}"

echo "=== NETWORK INFORMATION ===" >> $report

echo "IP Address:" >> $report
hostname -I >> $report
echo "" >> $report

echo "Network Interfaces:" >> $report
ip a >> $report
echo "" >> $report

echo "Routing Table:" >> $report
ip route >> $report
echo "" >> $report

echo "Open Ports:" >> $report
ss -tulnp >> $report
echo "" >> $report
}

# -----------------------------------------
# CONNECTIVITY TEST
# -----------------------------------------

connectivity_test(){

echo -e "${YELLOW}[+] Testing network connectivity...${RESET}"

echo "=== CONNECTIVITY TEST ===" >> $report

ping -c 2 google.com >> $report
echo "" >> $report

echo "DNS Lookup:" >> $report
nslookup google.com >> $report
echo "" >> $report

echo "Traceroute:" >> $report
traceroute google.com 2>/dev/null >> $report
echo "" >> $report
}

# -----------------------------------------
# SECURITY CHECKS
# -----------------------------------------

security_checks(){

echo -e "${YELLOW}[+] Running security checks...${RESET}"

echo "=== SECURITY CHECKS ===" >> $report

echo "SUID binaries:" >> $report
find / -perm -4000 -type f 2>/dev/null | head >> $report
echo "" >> $report

echo "World writable files:" >> $report
find / -perm -002 -type f 2>/dev/null | head >> $report
echo "" >> $report

echo "Sudo privileges:" >> $report
sudo -l 2>/dev/null >> $report
echo "" >> $report
}

# -----------------------------------------
# LOGIN ANALYSIS
# -----------------------------------------

login_analysis(){

echo -e "${YELLOW}[+] Checking login activity...${RESET}"

echo "=== LOGIN HISTORY ===" >> $report

echo "Recent logins:" >> $report
last -n 10 >> $report
echo "" >> $report

echo "Failed login attempts:" >> $report
grep "Failed password" /var/log/auth.log 2>/dev/null | tail >> $report
echo "" >> $report
}

# -----------------------------------------
# FULL SCAN
# -----------------------------------------

full_scan(){

system_info
users_enum
process_enum
network_enum
connectivity_test
security_checks
login_analysis

echo -e "${GREEN}[✔] Full system audit complete${RESET}"
echo "Report saved as $report"
}

# -----------------------------------------
# MENU
# -----------------------------------------

while true
do

echo ""
echo "---------------------------------------"
echo "1) System Information"
echo "2) User Enumeration"
echo "3) Process Analysis"
echo "4) Network Enumeration"
echo "5) Connectivity Tests"
echo "6) Security Checks"
echo "7) Login Analysis"
echo "8) Full System Audit"
echo "0) Exit"
echo "---------------------------------------"

read -p "Select option: " option

case $option in

1) system_info ;;
2) users_enum ;;
3) process_enum ;;
4) network_enum ;;
5) connectivity_test ;;
6) security_checks ;;
7) login_analysis ;;
8) full_scan ;;
0) exit ;;
*) echo -e "${RED}Invalid option${RESET}" ;;

esac

done