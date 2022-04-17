; Functions: contains general purpose functions which can
; be called from other files using %include directive

; strlen - calculates the length of a string

strlen:
	push	ebx;
	mov	ebx, eax

nextchar:
	cmp	byte [eax], 0
	jz	finished
	inc	eax
	jmp	nextchar

finished:
	sub	eax, ebx
	pop	ebx
	ret

; print - prints the contents of a string to STD_OUT

print:
	push	edx
	push	ecx
	push	ebx
	push	eax
	call	strlen

	mov	edx, eax
	pop	eax

	mov	ecx, eax
	mov	ebx, 1
	mov	eax, 4
	int	80h

	pop	ebx
	pop	ecx
	pop	edx
	ret

; println - prints a string followed by a line feed

println:
	call	print		; first print the string

	push	eax			; push EAX to the stack to preserve it
	mov		eax, 0Ah	; move the \n character to EAX
	push	eax			; push the line feed to the stack
	mov		eax, esp	; move the address pointed by the ESP to EAX
	call	print		; call our print function
	pop		eax			; pop the linefeed character from the stack
	pop		eax			; restore the value of eax befor our function was called
	ret

; quit - exits the program and restore resources

quit:
	mov	ebx, 0
	mov	eax, 1
	int	80h
	ret
