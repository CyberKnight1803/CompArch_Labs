.data 
newLine: .asciiz "\n" 
max: .asciiz "Max : " 
min: .asciiz "Min : " 

.text 
main:

    li $v0, 6
    syscall 

    mov.s $f1, $f0 

    li $v0, 6
    syscall 

    mov.s $f2, $f0 

    c.lt.s $f1, $f2 
    bc1f MAX
    
    MAX:
        la $a0, max 
        li $v0, 4
        syscall 

        mov.s $f12, $f2 
        li $v0, 2
        syscall 

        la $a0, newLine
        li $v0, 4
        syscall 

        la $a0, min 
        li $v0, 4
        syscall 

        mov.s $f12, $f1 
        li $v0, 2
        syscall 

        j EXIT 
    
    la $a0, max 
        li $v0, 4
        syscall 

        mov.s $f12, $f1
        li $v0, 3
        syscall 

        la $a0, newLine
        li $v0, 4
        syscall 

        la $a0, min 
        li $v0, 4
        syscall 

        mov.s $f12, $f2 
        li $v0, 3
        syscall 

        j EXIT 
    
    EXIT:
        li $v0, 10 
        syscall 



