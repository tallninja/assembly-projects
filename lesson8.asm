; Lesson 8: ussing command line argumants: they are pushed to the stack in reverse order
; Compile: nasm -f elf lesson8.asm
; Link: ld -m elf_i386 lesson8.o -o lesson8
; Run: ./lesson8 "Hello World !"

%include 'functions.asm'

section .text
global _start

_start:
    pop     ecx         ; first value in the stack is the number of arguments

nextarg:
    cmp     ecx, 0h     ; check to see if there are any arguments left
    jz      exit        ; jump to exit label if no more arguments left
    pop     eax         ; pop the next argument off the stack
    call    println
    dec     ecx
    jmp     nextarg

exit:
    call    quit
