; Lesson 7: adding the linefeed character
; Compile: nasm -f elf lesson7.asm
; Link: ld -m elf_i386 lesson7.o -o lesson7
; Run: ./lesson7

%include 'functions.asm'

SECTION .data

msg1    db      'Hello World One !', 0h
msg2    db      'Hello World Two !', 0h

SECTION .text
global _start

_start:
    mov     eax, msg1
    call    println

    mov     eax, msg2
    call    println

    call    quit