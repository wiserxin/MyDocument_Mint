#						P2	------	the		3nd	question
#						change the small type letters  into the greater one

.data
	string:  .ascii "String is:"
	data :   .byte 0: 1024
	
.text
li	$v0 , 5
syscall
move $t0, $v0				#read in the length and load it into t0
move $t1,$zero			#t1 = a counter that count 0 - 9
move $t3 , $zero			#t3 <==>	count the characters


la	$a0 , data 				# store the char into the adress saved in $a0
li	$a1 , 3
li	$v0 , 8

loop:
	syscall
	addi	$t3, $t3, 1
	lbu		$t2, ($a0)
	blt		$t2, 97, if_not_small
	bgt 	$t2,122, if_not_small
	addi	$t2 ,$t2 ,-32
	sb		$t2 , ($a0)
	
if_not_small:	
	addi	$a0 ,$a0 ,1
	addi	$t1, $t1, 1
#	bne	$t1,10, if_1	 # don't save the '\n' ------ if $t1 < 10
	move	$t1 , $zero
#	addi	$a0 , $a0 ,1	# print an '/n' every 10 characters
	
#if_1:						# if  $t1 < 10 ,	continue the loop
	
	bne $t0, $t3 , loop

sb	$zero, ($a0)
li	$v0 , 4
la	$a0, string
syscall
li	$v0 , 10
syscall
