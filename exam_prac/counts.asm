.data 
N: .space 4
ways: .asciiz "Total Ways: "
cross: .asciiz "x"
comma: .asciiz ", "
newLine: .asciiz "\n"

.text 
main:
    li $v0, 5
    syscall 

    sw $v0, N 
    move $s0, $v0  # s0 = N

    # Edge case when N = 0
    beqz $s0, TRIVIAL 

    li $s1, 1 # Step 1
    li $s2, 2 # Step 2
    li $s3, 0 # Total Ways

    div $s0, $s2 
    mflo $t0 

    WHILE:
        mult $t0, $s2 
        mflo $t1 

        sub $t2, $s0, $t1 

        move $a0, $t2 
        li $v0, 1
        syscall 

        jal CROSS

        li $a0, 1
        li $v0, 1
        syscall 

        jal COMMA

        move $a0, $t0
        li $v0, 1
        syscall 

        jal CROSS

        li $a0, 2
        li $v0, 1
        syscall 

        jal NEWLINE

        addi $s3, $s3, 1
        addi $t0, $t0, -1
        bge $t0, $zero, WHILE 

    la $a0, ways
    li $v0, 4
    syscall 

    move $a0, $s3 
    li $v0, 1
    syscall 

    j END     
    

    TRIVIAL:
        la $a0, ways
        li $v0, 4
        syscall 

        li $a0, 0
        li $v0, 1
        syscall 

    END:
        li $v0, 10
        syscall 


NEWLINE:
    la $a0, newLine
    li $v0, 4
    syscall 

    jr $ra 

CROSS:
    la $a0, cross 
    li $v0, 4
    syscall 

    jr $ra 

COMMA:
    la $a0, comma
    li $v0, 4
    syscall 

    jr $ra 