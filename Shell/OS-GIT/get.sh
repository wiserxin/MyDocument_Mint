#!/bin/sh

#scp -r 15061042@10.111.1.110:/home/15061042/MyDocument ./
#git clone 15061042@10.111.1.110:MyDocument 2   


src_pwd=15241110109xzm
expect -c "
spawn git clone 15061042@10.111.1.110:15061042-lab 2   
expect \"password:\"
send \"${src_pwd}\r\"
expect eof
"
