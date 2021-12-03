.text 
main:
    li $v0, 5
    syscall 

    move $s0, $v0 
    jal FACTORIAL

    move $a0, $v0

    li $v0, 1
    syscall 

    li $v0, 10
    syscall 

FACTORIAL:
    addi $sp, $sp, -8
    sw $a0, ($sp)
    sw $ra 4($sp)

    # Check base condition
    slti $t0, $a0, 1
    beq $t0, $zero, MULT    # Branch to MULT if n != 1

    li $v0, 1

    lw $a0, ($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

    MULT:
        addi $a0, $a0, -1 
        jal FACTORIAL

        lw $a0, ($sp)
        lw $ra, 4($sp) 
        addi $sp, $sp, 8 

        mult $a0, $v0
        mflo $v0

        jr $ra