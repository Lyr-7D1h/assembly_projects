section .bss
	num1 resb 1
	num2 resb 1

section .text
	global _start

_start:
	mov	eax, 3
	mov	ebx, 1
	mov	ecx, num1
	mov	edx, 2
	int	0x80
	
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, num1
	mov	edx, 1
	int	0x80

	mov	eax, 3
	mov	ebx, 1
	mov	ecx, num1
	mov	edx, 2
	int	0x80
	
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, num1
	mov	edx, 1
	int	0x80

	mov	eax, 1
	mov	ebx, 0
	int	0x80
