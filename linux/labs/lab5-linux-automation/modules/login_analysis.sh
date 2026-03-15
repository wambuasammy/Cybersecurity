login_analysis(){

$VERBOSE && echo "[+] Login analysis"

if command -v last >/dev/null 2>&1
then

last_login=$(last -n 1 | head -1 | awk '{print $1,$4,$5,$6}')
log_result "Login Analysis" "Last login" "$last_login" "INFO"

else

log_result "Login Analysis" "Last login" "command not available" "INFO"

fi


if command -v lastb >/dev/null 2>&1
then

failed_logins=$(lastb 2>/dev/null | wc -l)
log_result "Login Analysis" "Failed login attempts" "$failed_logins" "WARNING"

else

log_result "Login Analysis" "Failed login attempts" "command not available" "INFO"

fi

}