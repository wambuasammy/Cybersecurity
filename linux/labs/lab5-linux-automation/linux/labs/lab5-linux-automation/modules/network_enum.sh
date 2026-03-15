network_enum(){

$VERBOSE && echo "[+] Network enumeration"

ip_address=$(hostname -I | awk '{print $1}')
interfaces=$(ip -o link show | awk -F': ' '{print $2}' | paste -sd "," -)

log_result "Network" "Primary IP address" "$ip_address" "INFO"
log_result "Network" "Network interfaces" "$interfaces" "INFO"

}