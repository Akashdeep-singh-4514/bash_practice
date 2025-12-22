> file        # stdout
2> file       # stderr
&> file       # stdout + stderr
2>&1          # stderr → stdout


./1.printerro.sh 1> output.txt
output file has normal message and terminal prints error


./1.printerro.sh > output.txt
output file has normal message and terminal prints error

./1.printerro.sh 2> output.txt
output file has error message and terminal prints normal message

./1.printerro.sh &> output.txt
output file has normal messag and  error terminal is empty


./1.printerro.sh 2>&1 output.txt
both output and terminal has both messages
