#!/bin/sh

#scp -r MyDocument 15061042@10.111.1.110:/home/15061042/

#scp -r 15061042@10.111.1.110:/home/15061042/MyDocument ./


src_host=10.111.1.110
src_path_to=/home/15061042
src_path_local="MyDocument"
src_user=15061042
src_pwd=15241110109xzm
expect -c "
spawn scp -r ./${src_path_local} ${src_user}@${src_host}:${src_path_to}  
expect \"password:\"
send \"${src_pwd}\r\"
expect eof
"
