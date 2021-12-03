.data 
arr: .space 200 
n: .space 4 
target: .space 4

.text 
main:
    li $v0, 5
    syscall 

    sw $v0, n 

    lw $t1, n 
    li $t0, 1 
    la $s0, arr 

    INPUT:
        li $v0, 5
        syscall 

        sw $v0, ($s0)

        addi $t0, $t0, 1
        addi $s0, $s0, 4
        ble $t0, $t1, INPUT 
    
    li $v0, 5
    syscall 
    sw $v0, target


    lw $t9, target 
    la $s0, arr 
    SEARCH:
        li $t0, 0               # l = 0
        addi $t1, $t1, -1       # r = n - 1 
        ble $t0, $t1, LOOP     
    
    LOOP:
        add $t2, $t0, $t1 
        li $t3, 2              
        div $t2, $t3 
        mflo $t3 

        li $t4, 4 
        mult $t3, $t4 
        mflo $t5 

        add $s1, $s0, $t5
        lw $t6, ($s1) 

        beq $t6, $t9, EQUAL
        blt $t6, $t9, LESS 
        bgt $t6, $t9, GREAT

        A:
            ble $t0, $t1, LOOP
            
            li $a0, -1
            li $v0, 1
            syscall 

            j EXIT 
    
    EQUAL:
        move $a0, $t3 
        li $v0, 1
        syscall 

        j EXIT 
    
    LESS:
        addi $t0, $t3, 1
        j A 

    GREAT:
        addi $t1, $t3, -1 
        j A 
    

    EXIT:
        li $v0, 10
        syscall 