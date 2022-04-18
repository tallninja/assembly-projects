; Lesson 9 - standard input and the .bss section
; .bss - BLOCK started by symbol - used to reserve
; space in memory for uninitialised variables
; Compile: nasm -f elf lesson9.asm
; Link: ld -m elf_i386 lesson9.o -o lesson9
; Run: ./lesson9

%include 'functions.asm'

section .data

msg1		db	'What is your name ? ', 0h
msg2		db	'Hello ', 0h

section .bss

sinput:		resb	255	; 255 bytes of memory for input from the user 

section .text

global _start

_start:
	mov	eax, msg1
	call	print

	mov	edx, 255	; Number of bytes to read
	mov	ecx, sinput	; reserve space to store the input (buffer)
	mov	ebx, 0		; read from STDIN
	mov	eax, 3		; SYS_READ kernel opcode
	int	80h

	mov	eax, msg2
	call	print

	mov	eax, sinput
	call	print

	call	quit
