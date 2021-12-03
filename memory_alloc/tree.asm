.data 
space: .asciiz " "

.text
main:
    li $s0, 0

    # Read Input 
    READ:
        li $v0, 5
        syscall 

        beq $v0, $zero, STOP_READ 

        move $a0, $s0   # Root node
        move $a1, $v0   # Pass Input Value 

        jal INSERT 

        move $s0, $v0   # Update Root Node 

        j READ
    
    STOP_READ:
        move $a0, $s0  # Load Root 
        jal PREORDER 
    
    EXIT:
        li $v0, 10
        syscall 
    

# INSERT 
# ARGS: a0 -> Root node, a1 -> Value to be inserted
# Return: v0 -> Address of root element

INSERT:
    addi $sp, $sp, -20
    sw $s0, 16($sp) 
    sw $s1, 12($sp) 
    sw $s2, 8($sp) 
    sw $s3, 4($sp) 
    sw $ra, 0($sp)

    bne $a0, $zero, NON_TRIVIAL # a0 != 0

    li $a0, 12 
    li $v0, 9
    syscall 

    sw $a1, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)

    j END_INSERT 

    NON_TRIVIAL:
        move $s0, $a0 
        lw $t1, 0($a0)
        bgt $a1, $t1, RIGHT
    
    LEFT:
        lw $a0, 4($s0)
        jal INSERT 
        sw $v0, 4($s0)
        j NON_TRIVIAL_END 
    
    RIGHT:
        lw $a0, 8($s0)
        jal INSERT
        sw $v0, 8($s0)
        j NON_TRIVIAL_END

    NON_TRIVIAL_END:
        move $v0, $s0 

    END_INSERT:
        lw $s0, 16($sp)
        lw $s1, 12($sp) 
        lw $s2, 8($sp) 
        lw $s3, 4($sp)
        lw $ra, 0($sp) 
        addi $sp, $sp, 20 
    
        jr $ra 

INORDER:
    addi $sp, $sp, -20 
    sw $s0, 16($sp) 
    sw $s1, 12($sp)
    sw $s2, 8($sp) 
    sw $s3, 4($sp) 
    sw $ra, 0($sp) 

    move $s0, $a0 
    beq $s0, $zero, END_INORDER

    # Traverse Left
    lw $a0, 4($s0)
    jal INORDER

    # Print 
    lw $a0, 0($s0)
    li $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    # Traverse Right
    lw $a0, 8($s0)
    jal INORDER


    END_INORDER:
        lw $s0, 16($sp)
        lw $s1, 12($sp) 
        lw $s2, 8($sp) 
        lw $s3, 4($sp) 
        lw $ra, 0($sp) 
        addi $sp, $sp, 20

        jr $ra


PREORDER:
    addi $sp, $sp, -20 
    sw $s0, 16($sp) 
    sw $s1, 12($sp)
    sw $s2, 8($sp) 
    sw $s3, 4($sp) 
    sw $ra, 0($sp)

    move $s0, $a0
    beq $s0, $zero, END_PREORDER

    # Print 
    lw $a0, 0($s0)
    li $v0, 1
    syscall

    la $a0, space
    li $v0, 4
    syscall

    # Traverse Left
    lw $a0, 4($s0)
    jal PREORDER

    # Traverse Right 
    lw $a0, 8($s0)
    jal PREORDER

    END_PREORDER:
        lw $s0, 16($sp)
        lw $s1, 12($sp) 
        lw $s2, 8($sp) 
        lw $s3, 4($sp) 
        lw $ra, 0($sp) 
        addi $sp, $sp, 20

        jr $ra