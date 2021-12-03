.data 
myMsg: .asciiz "Hello bois"

.text
main:
    li $v0, 4
    la $a0, myMsg
    syscall

    li $v0, 10
    syscall