threat_detection(){

$VERBOSE && echo "[+] Threat detection"

for dir in $(echo $PATH | tr ":" " ")
do
if [ -w "$dir" ]
then
log_result "Threat Detection" "Writable PATH directory" "$dir" "WARNING"
fi
done

}