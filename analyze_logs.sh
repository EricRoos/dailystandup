cat log/development.log | grep -E -w "Processing|Completed|Started" log/development.log | cut -f 2-  -d ' ' |awk 'NR%3{printf "%s ",$0;next;}1' | cut -f 2,12,19 -d ' '

