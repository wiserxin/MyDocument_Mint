#						P2	------	the		2nd	question
#						find the prime number between 2 input numbers :  m and n

.data
	string:  .asciiz "The prime numbers are:\n"
	press_enter: .asciiz "\n"
	press_space: .asciiz " "
	data :   .byte 1:1001
	
.text
	li $v0 , 5
	syscall
	move $s0 , $v0		# $s0	=	number  m		the min of the numbers
	
	li $v0 , 5
	syscall
	move $s1 , $v0		# $s1	=	 number  n		the max of the numbers
	li	$t0 , 1
	move $t0, $zero		# $t0	=	the number (as well as the adress of it) that being judged now
	
	sb	$zero, data($t0)
	li	$t0 , 1 
	sb	$zero, data($t0)
	
loop:
	beq	$t0, 33 ,finish_loop
	addi	$t0, $t0 , 1
	lb 		$t1, data($t0)
	beq	$zero, $t1, loop	# if it has been judged , continue the loop
	nop
	move 	$t2 , $t0
	mult	$t2, $t0
	mflo	$t2					# the same function as :   int j=i*i
	
while:

	bgt		$t2, 1000, loop
	nop
	sb		$zero, data($t2)
	add	$t2, $t2, $t0
	j		while
	nop
	

finish_loop:
	li		$v0, 4
	la		$a0, string
	syscall

	move	$t0, $s0
	addi	$t0,$t0 , -1
	li		$v0,1
	li		$t1, 10
	
begin_print:					# play as if_not_prime too....	
	addi	$t0,$t0, 1
	bgt		$t0, $s1, end
	lb		$t4, data($t0)
	beq	$zero, $t4, begin_print

if_true:		#	if( isprime( $t0 )  )
	move	$a0,$t0
	syscall
	li		$v0, 4
	la		$a0, press_space
	syscall
	li		$v0, 1

	
	
	addi	$t1,$t1,-1
	bne	$zero, $t1, begin_print
	li		$t1, 10
	li		$v0, 4
	la		$a0, press_enter
	syscall
	li		$v0, 1
	j		begin_print
	
	
	
		
end:	
li	$v0 , 10
syscall
