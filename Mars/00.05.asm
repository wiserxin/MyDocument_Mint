#			P2-----------1st
.data
delay:  .word     0:1024
data:    .word     0 : 256       # storage for 16x16 matrix of words


.text
         li       $t0, 16        # $t0 = number of rows
         li       $t1, 16        # $t1 = number of columns
         move     $s0, $zero     # $s0 = row counter
         move     $s1, $zero     # $s1 = column counter
         move     $t2, $zero     # $t2 = the value to be stored
         move     $t3,$zero	     # $t3 = the block to be stored 
         
 loop:
 		mult  $t0 , $s1
 		mflo  $t2
 		add $t2 , $t2 , $s0 	       
 	       sll     $t3 , $t3 , 2
 	       sw      $t2  , data($t3)
 	       srl    $t3 , $t3 , 2
       	       addi  $t3  , $t3 , 1
       	      
       	        addi $s1 , $s1 , 1
       	       bne  $s1 , $t1 , loop
       	       nop
       	       
       	       move $s1 , $zero
       	       addi $s0 , $s0 , 1
       	       bne  $s0 , $t0 , loop
       	       nop
       	   
         li       $v0, 10        # system service 10 is exit
         syscall                 # we are outta here.
       	       
