 ori $a0, $0, 1
 jal loop
 sub $a2, $a1, $a0
 li $v0, 10
 syscall 
 
loop: 
 sll $a1, $a0, 3
 jr $ra
 add $a2, $a1, $a0