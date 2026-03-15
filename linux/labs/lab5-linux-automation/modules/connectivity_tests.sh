connectivity_tests(){

$VERBOSE && echo "[+] Connectivity tests"

ping -c 2 -W 2 google.com > /dev/null

if [ $? -eq 0 ]
then
log_result "Connectivity" "Internet connectivity" "Reachable" "OK"
else
log_result "Connectivity" "Internet connectivity" "Unreachable" "WARNING"
fi

}