; File: Lesson 3 - calculate the length of the string
; Compile: nasm -f elf lesson3.asm
; Link: ld -m elf_i386 lesson3.o -o lesson3
; Run: ./lesson3

SECTION .data

msg	db	'Hello World!', 0Ah

SECTION .text

global _start

_start:

	mov	ebx, msg
	mov	eax, ebx

nextchar:

	cmp	byte [eax], 0	; check that we have reached end of the string and sets the flags register to zero if equal
	jz	finished	; jump to finished if Zero flag is set
	inc	eax		; increment eax by 1 bayte (next character, increments the pointer)
	jmp	nextchar	; loop till we get to the end of the string

finished:

	sub	eax, ebx	; subtract ebx from eax in order to get the length of msg in bytes
	mov	edx, eax	; move the contents of EAX (Length of the string) to EBX
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	ebx, 0
	mov	eax, 1
	int	80h	
