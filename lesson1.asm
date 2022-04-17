; Hello world program
; Compile: nasm -f elf lesson1.asm
; Link (elf_i386 if in 64 bit system): ld -m elf_i386 lesson1.o -o lesson1
; Run: ./lesson1

SECTION .data

msg	db	'Hello World !', 0Ah 

SECTION .text

global _start

_start:

	mov	edx, 14		; store the size of msg variable in register EDX
	mov	ecx, msg	; store the pointer to msg in register ECX
	mov	ebx, 1		; write to STDOUT
	mov	eax, 4		; SYSCALL write
	int	80h
