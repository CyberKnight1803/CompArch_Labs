.data 
msgNum: .asciiz "Enter a number\n"
msgOperator: .asciiz "Enter operator (0 -> +, 1 -> -, 2-> *, 3-> /)\n"
msgResult: .asciiz "Result: "

.text 
main: 
    # Input - 1
    la $a0, msgNum 
    li $v0, 4
    syscall 

    li $v0, 5
    syscall 

    move $t0, $v0 

    # Input - 2
    li $v0, 4 
    syscall 

    li $v0, 5 
    syscall 

    move $t1, $v0 

    # Input - operator 
    la $a0, msgOperator 
    li $v0, 4 
    syscall 

    li $v0, 5 
    syscall 

    move $t2, $v0 

    beq $t2, 0, ADD
    beq $t2, 1, SUB 
    beq $t2, 2, MUL 
    beq $t2, 3, DIV 

    ADD:
        add $t2, $t0, $t1 
        j EXIT 
    
    SUB:
        sub $t2, $t0, $t1 
        j EXIT 
    
    MUL:
        mult $t0, $t1 
        mflo $t2 
        j EXIT 
    
    DIV: 
        div $t2, $t0, $t1  
        j EXIT 

    EXIT:
        la $a0, msgResult
        li $v0, 4 
        syscall 

        move $a0, $t2
        li $v0, 1 
        syscall 

        li $v0, 10
        syscall 