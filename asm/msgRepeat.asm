; Loop from 5 to 0
; Display a message
; If the counter is zero -> jump to a final message and end

global _start               ; Define entry point

section .text               ; Code section


_start:            ; mark starting point of program

    ; We cannot use rcx for counter due to syscall
    ; 'side effect' so we use r8
    mov r8, 5

    ; marker for beginning of loop
messagePoint:

    ; Printing the message
    ; accumulator -> syscall number (1)
    ; destination index -> stdout (1)
    ; source index -> address of message (slander)
    ; data -> length of message (slander.len1)
    mov rax, 1
    mov rdi, 1
    mov rsi, slander
    mov rdx, slander.len1

    syscall

    ; decrease counter and if not zero go back to beginning
    ; dec r8 decreases the integer in the register
    ; it will update RFLAGS
    ; until it reaches zero it will be flagged 'non-zero'
    ; therefore jnz will run
    dec r8
    jnz messagePoint

    ; Display second message
    mov rax, 1
    mov rdi, 1
    mov rsi, correction
    mov rdx, correction.len2

    syscall
    ; Normal exit for program
    ; Syscall 60 (exit)
    ; di should be zero (return 0)

    mov rax, 60
    mov rdi, 0
    syscall

section .data               ; Variables etc

    ; varName type value(s)
    slander: db "Owen calls it see-quel", 10
    ; equ $ - slander  -> assign current address minus previous address
    .len1 equ $ - slander

    correction: db "Actually he calls it see-sharp", 10
    .len2 equ $ - slander
