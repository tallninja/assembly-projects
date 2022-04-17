; Lesson 4:	Souboutines (use CALL instead of JMP we call a function and jump to labels)
; Compile:	nasm -f elf lesson4.asm
; Link:		ld -m elf_i386 lesson4.o -o lesson4
; Run:		./lesson4

SECTION .data

msg	db	'Hello World !', 0Ah

SECTION .text

global _start

_start:

	mov	eax, msg	; move the address of msg to EAX
	call	strlen		; call function to calculate length of msg

	mov	edx, eax
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	ebx, 0
	mov	eax, 1
	int	80h

strlen:

	push	ebx		; push the value of EBX to the stack to preserve it while used in this function
	mov	ebx, eax	; move the address of msg to EBX

nextchar:

	cmp	byte [eax], 0
	jz	finished
	inc	eax
	jmp	nextchar

finished:

	sub	eax, ebx
	pop	ebx		; pop the value on the stack back into EBX
	ret			; Return to where strlen was called
