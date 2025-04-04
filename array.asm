; Array demo -> array of bytes

global _start
section .data

; declare 10 words
someArray: db 0,1,2,3,4,5,6,7,8,9
.len equ $ - someArray

section .text
_start:

; counter
mov r8, someArray.len
mov r9, 0     ; displacement

arrayLoop:
; take current element in loop
; add 48 to turn into ASCII
mov r10, [someArray + r9]
add r10, 48
mov [someArray + r9], r10

; print element
mov rax, 1
mov rdi, 1
mov rsi, someArray
add rsi, r9
mov rdx, 1
syscall

; increase displacement by 1 and decrease counter
inc r9
dec r8
jnz arrayLoop

; exit code
mov rax, 60
mov rdi, 0
syscall
