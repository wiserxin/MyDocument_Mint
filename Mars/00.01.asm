#	if����{} else{} ���Ľ���...... 
#	Ӧ�� ֮ �Ƚϴ�С
.data
    array: .space 400
    str_1: .asciiz "Input the length...\n"
    str_2: .asciiz "Input the numbers...\n"
    str_3: .asciiz "Results..."
    space: .asciiz " "
    stack: .space 100 

.text
	li $t1, 112
	li $t2, 221
	
	
	slt $t3, $t2, $t1
	beq $t3, $zero, if_1_else


	#	��ת��if_1_end	#
	j if_1_end
	nop
	
if_1_else:
	#	����ַ���str_1	#
	la $a0 , str_1
	li $v0 , 4
	syscall
	
if_1_end:
	la $a0 , str_3
	li $v0 , 4
	syscall
	
	