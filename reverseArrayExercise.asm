; an array of 10 values (bytes)
; write code to invert it

global _start

section .bss
    reverseArray: resb 10   ; allocating space for 10 bytes

section .data
; array of 10 bytes and its length
    someArray: db 0,1,2,3,4,5,6,7,8,9
    .len equ $ - someArray

section .text
_start:

; Create a loop that copies the elements in someArray
; to reverseArray in reverse order
; and a loop to display the reversed elements

; exit code
    mov rax, 60
    mov rdi, 0
    syscall
