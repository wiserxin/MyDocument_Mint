#  SUM  OF  M   numbers

.data
	array: .space 400


.text
	li $v0, 5	#the int input will be saved in $v0
        syscall		#call the system to do the input 
        move $t0, $v0		#move what we have inputed to $t0		this is the N
        li $t1, 0			# this is the i
        la $t4, array		#this is the data 's place
        
        
        for_1_begin:
	slt $t3, $t1, $t0
	beq $t3, $zero, for_1_end
	nop
############	statement	#############
	li $v0, 5
	syscall
	
	sw $v0, 0($t4)
	addi $t4, $t4, 4
############	statement end	#############	
	addi $t1, $t1, 1	#i++
	j for_1_begin
	nop

for_1_end:
        la $t4, array		#this is the data 's place
        li $t1, 0			# this is the i
        li $v0, 5
        syscall
        move $t0, $v0		#move what we have inputed to $t0		this is the M
         
        for_2_begin:
	slt $t3, $t1, $t0
	beq $t3, $zero, for_2_end
	nop
############	statement	#############
	li $v0, 5
	syscall
	
	li $t3, 4
	mult $t3, $v0
	mflo $t3
	addu $t2, $t4, $t3
	lw $t3, 0($t2)
	
	addu $t5, $t5,$t3
	
############	statement end	#############	
	addi $t1, $t1, 1	#i++
	j for_2_begin
	nop       
        
 for_2_end:
        move $a0, $t5
        li $v0, 1
        syscall
 	
