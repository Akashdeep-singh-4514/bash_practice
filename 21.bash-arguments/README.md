run : bash 1.script.sh
syntax check : bash -n 3.syntax-error.sh
debug : bash -x 1.script.sh
debug with modification : PS4='[debug]: ' bash -x 1.script.sh
undefined check : bash -u 2.undefined.sh
