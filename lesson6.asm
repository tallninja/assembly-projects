; Lesson 6: In the previous lesson msg2 was being printed twice
; this is because we are not terminating our strings
; Compile: nasm -f elf lesson6.asm
; Link: ld -m elf_i386 lesson6.o -o lesson6
; Run: ./lesson6

%include	'functions.asm'

SECTION .data

msg1	db	'Hello World One !', 0Ah, 0h
msg2	db	'Hello World Two !', 0Ah, 0h

SECTION .text

global _start

_start:

	mov	eax, msg1
	call	print

	mov	eax, msg2
	call	print

	call	quit
