users_enum(){

$VERBOSE && echo "[+] User enumeration"

user_count=$(cut -d: -f1 /etc/passwd | wc -l)
sudo_users=$(getent group sudo | cut -d: -f4)

log_result "Users" "Total system users" "$user_count" "INFO"
log_result "Users" "Sudo users" "$sudo_users" "INFO"

}