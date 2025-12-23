#!/usr/bin/env bash
# ============================================
# Bash Notes: Pathname Expansion (Globbing)
# ============================================
# Globbing happens BEFORE the command runs.
# The shell expands patterns into matching filenames.
# Commands like ls/echo/printf just receive the result.

echo "=== Setup demo files ==="
mkdir -p files
touch files/foo.txt files/foo.jpg
touch files/bar.txt files/bar.jpg
touch files/baz.txt files/baz.jpg
touch files/foofoo.txt
echo

# --------------------------------------------
# *  (asterisk) → matches ANY string
# --------------------------------------------
echo "# * matches zero or more characters"
echo "echo files/*"
echo files/*
echo

# --------------------------------------------
# Listing one-per-line (better visibility)
# --------------------------------------------
echo "# printf shows each expanded path clearly"
printf '%s\n' files/*
echo

# --------------------------------------------
# *.ext → extension matching
# --------------------------------------------
echo "# Match only .txt files"
ls -1 files/*.txt
echo

echo "# Match only .jpg files"
ls -1 files/*.jpg
echo

# --------------------------------------------
# foo.* → same basename, different extensions
# --------------------------------------------
echo "# foo.* matches foo.txt and foo.jpg"
ls -1 files/foo.*
echo

# --------------------------------------------
# ?  (question mark) → matches exactly ONE char
# --------------------------------------------
echo "# ba?.txt matches bar.txt and baz.txt"
ls -1 files/ba?.txt
echo

# --------------------------------------------
# [abc] → character classes
# --------------------------------------------
echo "# ba[rz].txt matches bar.txt and baz.txt"
ls -1 files/ba[rz].txt
echo

echo "# ba[abc].txt → no match (no a/b/c)"
ls -1 files/ba[abc].txt 2>/dev/null || echo "No match"
echo

# --------------------------------------------
# Extended Globbing (needs shopt)
# --------------------------------------------
echo "# Enable extended globbing"
shopt -s extglob
echo

# --------------------------------------------
# @(pattern) → exactly one match
# --------------------------------------------
echo "# @(foo|bar).*"
ls -1 files/@(foo|bar).*
echo

# --------------------------------------------
# +(pattern) → one or more occurrences
# --------------------------------------------
echo "# +(foo).*"
ls -1 files/+(foo).*
echo

# --------------------------------------------
# ?(pattern) → zero or one occurrence
# --------------------------------------------
echo "# ?(foo).*"
ls -1 files/?(foo).*
echo

# --------------------------------------------
# *(pattern) → zero or more occurrences
# --------------------------------------------
echo "# *(foo).*"
ls -1 files/*(foo).*
echo

# --------------------------------------------
# !(pattern) → NOT matching pattern
# --------------------------------------------
echo "# !(foo).* (everything except foo.*)"
ls -1 files/!(foo).*
echo

# --------------------------------------------
# Important notes
# --------------------------------------------
cat <<'EOF'
================ IMPORTANT NOTES ================

1. Globbing is done by the SHELL, not by ls/echo.
2. If no match is found:
   - Pattern is left unchanged (default bash behavior)
3. Quote to PREVENT globbing:
   echo "files/*"   → literal text
4. Use printf instead of echo for clarity
5. extglob patterns require:
   shopt -s extglob

=================================================
EOF
