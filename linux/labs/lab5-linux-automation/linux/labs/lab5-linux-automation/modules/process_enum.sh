process_enum(){

$VERBOSE && echo "[+] Process enumeration"

top_process=$(ps aux --sort=-%cpu | awk 'NR==2 {print $11}')

process_count=$(ps -e | wc -l)

log_result "Processes" "Total running processes" "$process_count" "INFO"
log_result "Processes" "Highest CPU process" "$top_process" "INFO"

}