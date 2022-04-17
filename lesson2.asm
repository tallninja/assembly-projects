; File: Lesson 2
; Compile: nasm -f elf lesson2.asm
; Link: ld -m elf_i386 lesson2.o -o lesson2
; Run: ./lesson2

SECTION .data

msg	db	'Hello World !', 0Ah

SECTION .text

global _start

_start:
	mov	edx, 14
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4		; SYS_WRITE (kernel opcode 4)
	int	80h

	mov	ebx, 0		; return 0 status on exit - 'No Errors'
	mov	eax, 1		; SYS_EXIT (kernel opcode 1)
	int	80h
