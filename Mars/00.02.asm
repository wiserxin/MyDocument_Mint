#	for ( i=0 ; i < n ; i++ ) Óï¾äµÄ½üËÆ...... 

.text
    
    li $t1 , 100	 # as n
    li $t2, 0		 # as i
    
for_1_begin:
	slt $t3, $t2, $t1
	beq $t3, $zero, for_1_end
	nop
############	statement	#############
	
	
############	statement end	#############	
	addi $t2, $t2, 1	#i++
	j for_1_begin
	nop
	
	
for_1_end:
	
	
	