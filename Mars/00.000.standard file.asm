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
	
	
	
	
	
	
	
	
	
#	now let's finish the whole programme
	la	$a0 , final_words
	li	$v0 , 4
	syscall
	li	$v0 , 10
	syscall
	
