.data
	start_words: .asciiz "Press your keybord and enter your idea now !\n"
	final_words: .asciiz "\nNow bye-bye...\nloving you\n = ' w ' ="
	press_enter: .asciiz "\n"
	press_space: .asciiz " "
	
	array_1: .word  0:256		# set the original value
	array_2: .word  1:256
	
.text
	
#	now	print the " start words... "	
	la	$a0 , start_words
	li	$v0 , 4
	syscall

loop:	

#	choose array_1 's  row  and array_2's column	in fact they're the same number
#	and choose the two numbers to be calculated		muiti and add -find 2 address		$	using 5 registers
	loop_2:
	
#	muiti the connected numbers and sum them one by one using loop_2							$	using 3 registers


#	then go to loop until all is well

#	now all is well
	
	
#	now let's finish the whole programme
	la	$a0 , final_words
	li	$v0 , 4
	syscall
	li	$v0 , 10
	syscall
	
