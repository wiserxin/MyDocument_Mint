#	basic  I / O
.data
	array: .space 400
	message_input_n: .asciiz "Input the number"
	message_input_array: .asciiz "Input the int"
	message_output_array: .asciiz "the result"
	space: .asciiz " "


.text 

    input:
        la $a0, message_input_n
        li $v0, 4
        syscall
        ##		print  "message_input_n ' s"  label's   message   on  the  screen
        
        li $v0, 5	#the int input will be saved in $v0
        syscall		#call the system to do the input 
        move $t0, $v0		#move what we have inputed to $t0
       
    li $t1, 0		 # as i
    
for_1_begin:
	slt $t2, $t1, $t0
	beq $t2, $zero, for_1_end
	nop
############	statement	#############
	la $t2, array
	li $t3, 4
	mult $t3, $t1
	mflo $t3
	addu $t2, $t2, $t3
	
	la $a0, message_input_array
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, 0($t2)
############	statement end		#############	
	addi $t1, $t1, 1	#i++
	j for_1_begin
	nop
	
for_1_end: