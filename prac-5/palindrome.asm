.data
S: .space 6 
pal: .asciiz "String is a palindrome"
npal: .asciiz "String is not a palindrome" 
newLine: .asciiz "\n"

.text 
main:

la $a0, S 
li $a1, 6 

li $v0, 8
syscall 


add $t0, $a0, $zero 
add $t1, $a0, $a1 
addi $t1, $t1, -2

PAL:
    lb $t2, ($t0) 
    lb $t3, ($t1)
    bne $t2, $t3, NOTPAL
    addi $t0, $t0, 1
    addi $t1, $t1, -1
    ble $t0, $t1, PAL 

la $a0, pal 
li $v0, 4
syscall 
j EXIT

NOTPAL:
    la $a0, npal 
    li $v0, 4
    syscall 

    j EXIT 


EXIT:
    li $v0, 10
    syscall 