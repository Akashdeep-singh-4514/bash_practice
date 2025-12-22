#!/usr/bin/env bash

# =====================================================
# Bash Process Substitution - Notes
# =====================================================
# Process substitution allows the output of a command
# to be treated like a file.
#
# Syntax:
#   <(command)   → output of command (read-only)
#   >(command)   → input to command (write-only)
#
# Bash creates a temporary file descriptor:
#   /dev/fd/N
#
# Works in Bash, Zsh (NOT POSIX sh)
# =====================================================


echo "======================================="
echo "1. Basic Process Substitution"
echo "======================================="

diff <(echo "hello") <(echo "world") || true
echo


echo "======================================="
echo "2. Real file vs command output"
echo "======================================="

echo -e "a\nb\nc" > file.txt

diff file.txt <(printf "a\nb\nc\n")
echo "file compared with command output"
echo


echo "======================================="
echo "3. Process substitution vs pipe"
echo "======================================="

# Pipe: left command writes to stdin of right command
echo "apple banana cherry" | tr ' ' '\n'

# Process substitution: command behaves like a file
tr ' ' '\n' < <(echo "apple banana cherry")
echo


echo "======================================="
echo "4. Multiple command outputs"
echo "======================================="

paste <(ls | head -3) <(pwd) <(whoami)
echo


echo "======================================="
echo "5. Using with while read (BEST PRACTICE)"
echo "======================================="

while IFS= read -r line; do
  echo "Line: $line"
done < <(ls | head -3)
echo


echo "======================================="
echo "6. Sending output TO a command"
echo "======================================="

echo "hello world" > >(tr 'a-z' 'A-Z')
echo


echo "======================================="
echo "7. Process substitution in logging"
echo "======================================="

echo "This goes to both screen and file" | tee >(cat > log.txt)
echo "Log written using process substitution"
echo


echo "======================================="
echo "8. Inspect what Bash creates"
echo "======================================="

tmpfile=<(echo "inspect me")
echo "Process substitution file: $tmpfile"
ls -l "$tmpfile"
echo


echo "======================================="
echo "9. Common Mistakes"
echo "======================================="

# ❌ This will NOT work in /bin/sh
# sh script.sh

# ❌ Won't work on very old systems without /dev/fd

echo "Process substitution is Bash-specific"
echo


echo "======================================="
echo "10. Summary"
echo "======================================="

echo "- <(cmd) gives command output as a file"
echo "- >(cmd) sends output to a command"
echo "- Uses /dev/fd internally"
echo "- Cleaner than temporary files"
echo "- Very common in DevOps & scripting"
