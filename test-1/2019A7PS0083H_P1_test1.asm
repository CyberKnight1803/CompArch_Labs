# ID 2019A7PS0083H 
# Name Omkar Pitale
# Contact 7977817363

.data
string: .space 1000
input: .asciiz "Input: "
itsa: .asciiz "It is a "
itsnota: .asciiz "It is not a "
wp: .asciiz "-way palindrome."
cp: .asciiz "-way complete palindrome."
k: .asciiz "k"
newline: .asciiz "\n"
 
.text
main:
    la $a0, input
    li $v0, 4
    syscall
    la $a0, string
    li $a1, 1000
    li $v0, 8
    syscall
 
    la $t2, string
    lb $t4, newline
    li $t0, -1
    slen:
        lb $t3, ($t2)
        addi $t2, $t2, 1
        beq $t3, $t4, next
        addi $t0, $t0, 1
        j slen
 
    next:
    li $t1, 1
    LOOP:
        li $a0, 0
        move $a1, $t1
        jal palindromeFunction
        addi $t1, $t1, 1
        beqz $v0, palFalse
        move $a0, $t1
        move $a1, $t0
        jal palindromeFunction
        bne $v0, $zero, exitTrue
        palFalse: blt $t1, $t0, LOOP
    
    li $t9, 0
    la $a0, itsnota
    li $v0, 4
    syscall
    la $a0, k
    li $v0, 4
    syscall
    la $a0, wp
    li $v0, 4
    syscall
    j checkPal
        
    exitTrue:
    la $a0, itsa
    li $v0, 4
    syscall
    move $a0, $t1
    move $t9, $a0
    li $v0, 1
    syscall
    la $a0, wp
    li $v0, 4
    syscall
 
    checkPal:
    li $a0, 0
    move $a1, $t0
    jal palindromeFunction
    beqz $v0, NOTPAL
 
    PAL:
    la $a0, isa
    li $v0, 4
    syscall
    la $a0, k
    li $v0, 4
    beqz $t9, printTrue
    move $a0, $t9
    li $v0, 1
    printTrue:
    syscall
    la $a0, cp
    li $v0, 4
    syscall
    li $v0, 10
    syscall
 
    NOTPAL:
    la $a0, itsnota
    li $v0, 4
    syscall
    la $a0, k
    li $v0, 4
    beqz $t9, printFalse
    move $a0, $t9
    li $v0, 1
    printFalse:
    syscall
    la $a0, cp
    li $v0, 4
    syscall
    li $v0, 10
    syscall
 
palindromeFunction:
    la $s2, string
    add $s0, $s2, $a0
    add $s1, $s2, $a1
 
    LOOPL:
        lb $s5, 0($s0)
        lb $s6, 0($s1)
        bne $s5, $s6, isNotPal
        addi $s5, $s5, 1
        addi $s6, $s6, -1
        blt $s5, $s6, LOOPL
 
    isPal:
        li $v0, 1
        jr $ra
 
    isNotPal:
        li $v0, 0
        jr $ra