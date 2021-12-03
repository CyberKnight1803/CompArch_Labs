.text 

main : 
	
	li $t0, 5
	li $t1, 6
	
	add $t2, $t0, $t1
	move $a0, $t2
	
	li $v0, 1
	syscall
		
	li $v0, 10
	syscall

	