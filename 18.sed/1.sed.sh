#!/usr/bin/env bash

# =====================================================
# Bash Stream Editor: sed - Notes
# =====================================================
# sed is used for:
# 1. Text substitution
# 2. Deletion
# 3. Insertion / Appending
# 4. Transforming text streams
#
# Works with stdin or files
# =====================================================

echo "======================================="
echo "1. Basic sed substitution"
echo "======================================="

echo -e "apple\nbanana\ncherry" > fruits.txt

echo "Original file:"
cat fruits.txt
echo

# Substitute 'banana' with 'mango'
sed 's/banana/mango/' fruits.txt
echo

# Substitute globally (all occurrences in a line)
echo -e "one two two one" > test.txt
sed 's/two/TWO/g' test.txt
echo


echo "======================================="
echo "2. In-place editing (-i)"
echo "======================================="

# Replace 'apple' with 'orange' in the file itself
sed -i 's/apple/orange/' fruits.txt
echo "After in-place edit:"
cat fruits.txt
echo


echo "======================================="
echo "3. Deleting lines"
echo "======================================="

# Delete 2nd line
sed '2d' fruits.txt
echo

# Delete lines matching a pattern
sed '/cherry/d' fruits.txt
echo


echo "======================================="
echo "4. Print specific lines"
echo "======================================="

# Print only 1st line
sed -n '1p' fruits.txt
echo

# Print lines 1 to 2
sed -n '1,2p' fruits.txt
echo


echo "======================================="
echo "5. Insert / Append text"
echo "======================================="

# Insert text before 2nd line
sed '2i\Inserted line' fruits.txt
echo

# Append text after 1st line
sed '1a\Appended line' fruits.txt
echo


echo "======================================="
echo "6. Using sed with pipes"
echo "======================================="

echo "Hello World" | sed 's/World/Bash/'
echo

# Remove digits from input
echo "User123 Test456" | sed 's/[0-9]//g'
echo


echo "======================================="
echo "7. Multiple commands"
echo "======================================="

# Using -e for multiple sed commands
sed -e 's/orange/fruit/' -e 's/cherry/berry/' fruits.txt
echo


echo "======================================="
echo "8. Notes / Tips"
echo "======================================="

echo "- s/pattern/replacement/  → substitute"
echo "- g flag = global replacement in line"
echo "- -i      = in-place edit"
echo "- d       = delete line"
echo "- n,p     = print specific lines"
echo "- i / a   = insert / append lines"
echo "- Works with stdin or file"
echo "- Combine with pipes for powerful text processing"
echo

# Cleanup
rm fruits.txt test.txt
