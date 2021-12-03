.data 
N: .space 4 
A: .space 4
T: .space 4

arbitrary_arr: .space 4

space: .asciiz " "

.text 
main:
    li $v0, 5 
    syscall 

    sw $v0, N 
    move $a0, $v0 
    li $t0, 4
    mult $a0, $t0

    # Allocate Mem 
    mflo $a0 
    li $v0, 9
    syscall 
    
    sw $v0, A   # base address of array 

    li $v0, 5
    syscall 
    sw $v0, T


    # Take Input 
    lw $a0, A 
    lw $a1, N 
    jal INPUT_ARR

    lw $a0, A 
    lw $a1, N 
    jal BUBBLE_SORT

    # lw $a0, A
    # lw $a1, N 
    # jal PRINT_ARR 

    lw $a0, A 
    lw $a1, N 
    lw $a2, T 
    jal BINARY_SEARCH

    move $a0, $v0 
    li $v0, 1
    syscall 
    
    # RETURN
    li $v0, 10
    syscall 




# INPUT_ARR
# $a0 = A 
# $a1 = N 
# No return 
INPUT_ARR:
    addi $sp, $sp, -12
    sw $s0, 8($sp)
    sw $s1, 4($sp) 
    sw $ra, 0($sp)

    move $s0, $a0
    move $s1, $a1

    li $t0, 0
    INPUT_WHILE:
        li $v0, 5
        syscall 

        sw $v0, ($a0)

        addi $a0, $a0, 4
        addi $t0, $t0, 1
        blt $t0, $a1, INPUT_WHILE 

    lw $s0, 8($sp)
    lw $s1, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 12 

    jr $ra 

# PRINT
# $a0 = A 
# $a1 = N 
# No return
PRINT_ARR:
    addi $sp, $sp, -16
    sw $s0, 12($sp)
    sw $s1, 8($sp) 
    sw $s2, 4($sp)
    sw $ra, 0($sp) 

    move $s0, $a0 
    move $s2, $a0 
    move $s1, $a1 

    li $t0, 0
    PRINT_WHILE:
        lw $a0, ($s2)
        li $v0, 1
        syscall 

        la $a0, space 
        li $v0, 4
        syscall 

        addi $s2, $s2, 4
        addi $t0, $t0, 1
        blt $t0, $a1, PRINT_WHILE 

    lw $s0, 12($sp)
    lw $s1, 8($sp)
    lw $s2, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 16

    jr $ra 


# BUBBLE SORT 
# $a0 = A 
# $a1 = N 
# Return None 

BUBBLE_SORT:
    addi $sp, $sp, -20
    sw $s0, 16($sp)
    sw $s1, 12($sp)
    sw $s2, 8($sp)
    sw $s3, 4($sp)
    sw $ra, 0($sp)

    # sw $a0, arbitrary_arr
    move $s0, $a0 
    move $s1, $a1 

    move $s2, $a0 
    move $s3, $a1 
    addi $s3, $s3, -1 # $s3 = N - 1

    li $t0, 0        # i = 0
    li $t1, 4

    OUTER_LOOP:
        li $t2, 0  # j = 0
        sub $t3, $s3, $t0  # $t3 = N - 1 - i 

        blt $t2, $t3, INNER_LOOP 

        INNER_LOOP_END:
            addi $t0, $t0, 1
            blt $t0, $s3, OUTER_LOOP
            j END_BUBBLE_SORT

    INNER_LOOP:
        move $t4, $t2 
        mult $t4, $t1 
        mflo $t4

        add $s2, $s0, $t4 
        lw $t5, ($s2) 

        addi $s2, $s2, 4
        lw $t6, ($s2)

        ble $t5, $t6, NO_SWAP

        sw $t5, ($s2)
        addi $s2, $s2, -4
        sw $t6, ($s2)

        NO_SWAP:
            addi $t2, $t2, 1
            blt $t2, $t3, INNER_LOOP
            j INNER_LOOP_END

    END_BUBBLE_SORT:
        lw $s0, 16($sp)
        lw $s1, 12($sp) 
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $ra, 0($sp) 

        jr $ra 


# Binary search 
# $a0 = A 
# $a1 = N 
# $a2 = T
# Return: $v0 = index

BINARY_SEARCH:
    addi $sp, $sp, -20
    sw $s0, 16($sp)
    sw $s1, 12($sp)
    sw $s2, 8($sp)
    sw $s3, 4($sp)
    sw $ra, 0($sp)

    move $s0, $a0 
    move $s1, $a1 
    move $s2, $a0 
    move $s3, $a2 

    li $t0, 0           # l = 0
    addi $t1, $s1, -1   # r = n - 1

    li $t2, 2
    li $t3, 4
    li $t7, -1
    SEARCH_WHILE:
        add $t4, $t0, $t1 
        div $t4, $t2 
        mflo $t4

        mult $t4, $t3 
        mflo $t5 

        add $s2, $s0, $t5

        lw $t6, ($s2) 
        beq $t6, $s3, FOUND

        ble $s3, $t6, LEFT 
        RIGHT:
            move $t0, $t4 
            addi $t0, $t0, 1
            j END_SEARCH_WHILE

        LEFT:
            move $t1, $t4
            addi $t1, $t1, -1 

        END_SEARCH_WHILE:
            ble $t0, $t1, SEARCH_WHILE
            j END_BINARY_SEARCH

    FOUND:
        move $t7, $t4 

    END_BINARY_SEARCH:
        move $v0, $t7   # Index

        lw $s0, 16($sp)
        lw $s1, 12($sp) 
        lw $s2, 8($sp)
        lw $s3, 4($sp)
        lw $ra, 0($sp)
        addi $sp, $sp, 20

        jr $ra 