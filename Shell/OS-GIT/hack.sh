#!/bin/sh

#scp -r 15061042@10.111.1.110:/home/15061042/MyDocument ./
#git clone 15061042@10.111.1.110:MyDocument 2   


src_pwd=$1
expect -c "
spawn git clone $1@10.111.1.110:$1-lab $1   
expect \"password:\"
send \"${src_pwd}\r\"
expect eof
"

