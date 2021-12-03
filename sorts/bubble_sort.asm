.data 
arr: .space 200
n: .space 4
whitespace: .asciiz " "

.text 
main:
    li $v0, 5
    syscall 
    sw $v0, n 

    lw $t0, n 
    la $s0, arr 
    li $t1, 1

    INPUT:
        li $v0, 5
        syscall 

        sw $v0, ($s0)
        addi $t1, $t1, 1
        addi $s0, $s0, 4
        ble $t1, $t0, INPUT 
    
    # Bubble Sort
    addi $t0, $t0, -1
    li $t1, 0 
    la $s0, arr 

    OUTER_LOOP:
        li $t2, 0
        sub $t3, $t0, $t1
        move $s1, $s0 
        addi $s2, $s1, 4
        blt $t2, $t3, INNER_LOOP
        P:
            addi $t1, $t1, 1  
            blt $t1, $t0, OUTER_LOOP
            j EXIT

    INNER_LOOP: 
        lw $t4, ($s1)
        lw $t5, ($s2) 
        bgt $t4, $t5, SWAP
        A:

            addi $t2, $t2, 1
            addi $s1, $s1, 4 
            addi $s2, $s2, 4
            blt $t2, $t3, INNER_LOOP
            j P 
    
    SWAP: 
        sw $t4, ($s2) 
        sw $t5, ($s1) 
        j A 



    EXIT:
        # Print Sorted Array
        lw $t0, n
        li $t1, 1
        la $s0, arr 
        PRINT:
            lw $a0, ($s0)
            li $v0, 1
            syscall 

            la $a0, whitespace
            li $v0, 4
            syscall 

            addi $t1, $t1, 1
            addi $s0, $s0, 4
            ble $t1, $t0, PRINT 
            

        li $v0, 10 
        syscall 