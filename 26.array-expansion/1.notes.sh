#!/usr/bin/env bash

# =====================================================
# Bash Array Expansion - Notes
# =====================================================
# This script demonstrates:
# - Indexed arrays
# - ${arr[@]} vs ${arr[*]}
# - Slicing arrays
# - Pattern replacement in arrays
# - Prefix / suffix removal on arrays
# - Interaction with IFS
# =====================================================


# -------------------------------------
# 1. Declare an array
# -------------------------------------
arr=(foo bar baz)

echo "Array elements:"
printf '%s\n' "${arr[@]}"
echo


# -------------------------------------
# 2. Printing words vs array expansion
# -------------------------------------
echo "Normal words:"
printf '%s\n' hello how are you
echo


# -------------------------------------
# 3. ${arr[@]}  (expand each element)
# -------------------------------------
echo 'Using ${arr[@]}'
printf '%s\n' "${arr[@]}"
echo


# -------------------------------------
# 4. Array slicing
# -------------------------------------
# Syntax: ${arr[@]:offset:length}

echo 'Slice from index 1:'
printf '%s\n' "${arr[@]:1}"
echo

echo 'Slice index 2 only:'
printf '%s\n' "${arr[@]:2}"
echo

echo 'Slice first two elements:'
printf '%s\n' "${arr[@]:0:2}"
echo


# -------------------------------------
# 5. Pattern replacement on arrays
# -------------------------------------
# Applied to EACH element

echo "Replace 'a' with 'o' (global)"
printf '%s\n' "${arr[@]//a/o}"
echo


# -------------------------------------
# 6. Remove suffix using %
# -------------------------------------
echo "Remove shortest suffix 'z'"
printf '%s\n' "${arr[@]%z}"
echo


# -------------------------------------
# 7. Remove prefix using #
# -------------------------------------
echo "Remove shortest prefix 'b'"
printf '%s\n' "${arr[@]#b}"
echo


# -------------------------------------
# 8. ${arr[*]} vs ${arr[@]}
# -------------------------------------
echo 'Using ${arr[*]} (unquoted)'
printf '%s\n' ${arr[*]}
echo

echo 'Using ${arr[@]} (unquoted)'
printf '%s\n' ${arr[@]}
echo


# -------------------------------------
# 9. Quoted behavior difference (IMPORTANT)
# -------------------------------------
echo 'Quoted ${arr[@]}'
printf '%s\n' "${arr[@]}"
echo

echo 'Quoted ${arr[*]}'
printf '%s\n' "${arr[*]}"
echo


# -------------------------------------
# 10. IFS impact on ${arr[*]}
# -------------------------------------
echo 'IFS=_ with ${arr[*]}'
(IFS=_; echo "${arr[*]}")
echo

echo 'IFS=_ with ${arr[@]}'
(IFS=_; echo "${arr[@]}")
echo


# -------------------------------------
# 11. Summary (as comments)
# -------------------------------------
# ${arr[@]}  → expands to multiple words
# ${arr[*]}  → expands to single word when quoted
#
# "${arr[@]}" → SAFE (preserves elements)
# "${arr[*]}" → joins elements using IFS
#
# Pattern removal & replacement apply PER element
# Array slicing works like string slicing
#
# ALWAYS prefer "${arr[@]}" in scripts
