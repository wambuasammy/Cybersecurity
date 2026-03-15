security_checks(){

$VERBOSE && echo "[+] Security checks"

if [ -w /etc/passwd ]
then
log_result "Security Check" "/etc/passwd writable" "Yes" "CRITICAL"
else
log_result "Security Check" "/etc/passwd writable" "No" "OK"
fi

suid_count=$(find / -perm -4000 -type f 2>/dev/null | wc -l)

log_result "Security Check" "SUID binaries count" "$suid_count" "INFO"

}