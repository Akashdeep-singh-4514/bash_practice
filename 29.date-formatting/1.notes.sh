#!/usr/bin/env bash
#
# ==========================================
# Bash DATE & STRFTIME NOTES
# ==========================================
#
# date uses strftime(3) format specifiers internally.
# man strftime  -> format reference
#

echo "========================="
echo "1. Basic date command"
echo "========================="

# Current date and time (default format)
date


echo
echo "========================="
echo "2. Unix epoch time"
echo "========================="

# Seconds since Jan 1, 1970 (UTC)
date +%s


echo
echo "========================="
echo "3. Custom date format"
echo "========================="

# Store format in a variable
datefmt='%Y/%m/%d %H:%M:%S'

echo "Format string:"
echo "$datefmt"

# Apply format
date +"$datefmt"


echo
echo "========================="
echo "4. Common strftime specifiers"
echo "========================="

cat <<EOF
%Y  -> Year (4 digits)
%m  -> Month (01-12)
%d  -> Day (01-31)

%H  -> Hour (00-23)
%M  -> Minute (00-59)
%S  -> Second (00-60)

%F  -> %Y-%m-%d
%T  -> %H:%M:%S
EOF

# Example
date +"%F %T"


echo
echo "========================="
echo "5. date inside printf"
echo "========================="

# date expansion happens before printf runs
printf "the date is %s\n" "$(date +"$datefmt")"


echo
echo "========================="
echo "6. printf + date format directly"
echo "========================="

# date formatting inside printf string
printf "the date is %(%Y/%m/%d %H:%M:%S)T\n" -1
printf "the date is %(%Y/%m/%d %H:%M:%S)T\n" -1


echo
echo "========================="
echo "7. %T with printf (bash-specific)"
echo "========================="

# %(... )T is a bash printf extension
# Argument meaning:
#   -1  -> current time
#    0  -> epoch
#  >0   -> seconds since epoch

printf "now:    %(%F %T)T\n" -1
printf "epoch:  %(%F %T)T\n" 0
printf "1000s:  %(%F %T)T\n" 1000


echo
echo "========================="
echo "8. Negative & invalid values"
echo "========================="

# Negative values = seconds before epoch
printf "before epoch: %(%F %T)T\n" -2

# Very large numbers
printf "large seconds: %(%F %T)T\n" 10000


echo
echo "========================="
echo "9. Mixing printf arguments"
echo "========================="

# Correct argument order matters
printf "date=%(%F %T)T name=%s\n" -1 dave


echo
echo "========================="
echo "10. Common mistakes"
echo "========================="

cat <<'EOF'
❌ Using %d accidentally for date in printf
   %d expects an INTEGER, not date format

❌ Missing argument for %T
   printf "%(%F)T\n"   -> ERROR

✅ Always pass a number after %T
   -1 = now
EOF


echo
echo "========================="
echo "11. Best practices"
echo "========================="

cat <<'EOF'
✔ Use `date +"FORMAT"` for portability
✔ Use printf %(... )T only in bash scripts
✔ Quote format strings
✔ Prefer epoch time for comparisons
EOF


echo
echo "========================="
echo "End of date & strftime notes"
echo "========================="
