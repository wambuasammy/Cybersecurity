system_info(){

$VERBOSE && echo "[+] System information"

hostname_value=$(hostname)
kernel_value=$(uname -r)
os_value=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

log_result "System Info" "Hostname" "$hostname_value" "INFO"
log_result "System Info" "Kernel Version" "$kernel_value" "INFO"
log_result "System Info" "Operating System" "$os_value" "INFO"

}