#!/usr/bin/env bash

echo "=============================="
echo "1. Default IFS behavior"
echo "=============================="

text="apple banana cherry"

for item in $text; do
  echo "Item: $item"
done


echo
echo "=============================="
echo "2. Using IFS with comma-separated values"
echo "=============================="

csv="red,green,blue"

IFS=',' read -r color1 color2 color3 <<< "$csv"

echo "Color 1: $color1"
echo "Color 2: $color2"
echo "Color 3: $color3"


echo
echo "=============================="
echo "3. IFS only for one command (safe way)"
echo "=============================="

data="john:25:delhi"

IFS=':' read -r name age city <<< "$data"

echo "Name : $name"
echo "Age  : $age"
echo "City : $city"


echo
echo "=============================="
echo "4. What happens if IFS is NOT reset"
echo "=============================="

IFS=','
list="one two three"

for word in $list; do
  echo "Word: $word"
done

echo "⚠️  Words were NOT split by spaces!"


echo
echo "=============================="
echo "5. Correct way: restore IFS"
echo "=============================="

unset IFS

for word in $list; do
  echo "Word: $word"
done


echo
echo "=============================="
echo "6. Reading file line-by-line safely"
echo "=============================="

printf "line one\nline two\nline three\n" > demo.txt

while IFS= read -r line; do
  echo "Line: $line"
done < demo.txt

rm demo.txt

