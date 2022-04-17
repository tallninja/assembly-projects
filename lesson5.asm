; Lesson 5: external include files
; Compile: nasm -f elf lesson5.asm
; Link: ld -m elf_i386 lesson5.o -o lesson5
; Run: ./lesson5

%include	'functions.asm'

SECTION .data

msg1	db	'Hello World One !', 0Ah
msg2	db	'Hello World Two !', 0Ah

SECTION .text

global _start

_start:

	mov eax, msg1
	call printstr

	mov eax, msg2
	call printstr

	call quit
