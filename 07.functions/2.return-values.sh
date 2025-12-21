#!/usr/bin/env bash

return_arg(){
  echo "$1"
}

return_success(){
    return 0
}

return_fail(){
    return 5
}

# 1. Capture output using $(...) and remove spaces around =
name=$(return_arg "akash")
echo "name is $name"

# 2. To check return codes, you run the function and check $?
return_success
echo "Success function returned status: $?"

return_fail
echo "Fail function returned status: $?"
