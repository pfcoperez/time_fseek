#!/bin/bash
B64_BIN="B64CONTENTS_"

BIN_NAME="seek_tail"
echo $B64_BIN | tr ' ' '\n' | base64 -d > $BIN_NAME
chmod u+x $BIN_NAME
./$BIN_NAME $1
strace --syscall-times=us ./$BIN_NAME $1 2>&1 | grep seek
rm $BIN_NAME