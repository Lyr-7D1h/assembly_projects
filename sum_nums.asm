SYS_EXIT 	equ 1
SYS_READ	equ 3
SYS_WRITE 	equ 4
STDIN 		equ 0
STDOUT		equ 1

section .data
	welcome_message db 'Welcome to my program', 0x0A ; welcome message + newline \n (0x0a)
	welcome_message_len equ	$-welcome_message
	
	ask_num_msg db 'Please enter number: '
	ask_num_msg_len equ $-ask_num_msg

	ask_second_num_msg db 'Please enter second number: ' 
	ask_second_num_msg_len equ $-ask_second_num_msg

	result_msg db 'Result is '
	result_msg_len equ $-result_msg

section .bss	; 0 filled memory space
	num1 resb 1

section	.text	; linker
	global _start

write_msg:
	mov	eax, SYS_WRITE
	mov	ebx, STDOUT
	int	0x80
	ret
		

_start:
	mov	ecx, welcome_message
	mov	edx, welcome_message_len
	call	write_msg
	
	mov	ecx, ask_num_msg
	mov	edx, ask_num_msg_len
	call	write_msg

	mov	eax, SYS_READ
	mov	ebx, 2
	mov	ecx, num1
	mov	edx, 1
	int 	0x80

	mov	ecx, ask_second_num_msg
	mov	edx, ask_second_num_msg_len
	call	write_msg

	mov	eax, SYS_READ
	mov	ebx, 2
	mov	ecx, num1
	mov	edx, 1
	int	0x80
	
	mov	ecx, result_msg
	mov	edx, result_msg_len

	mov	eax, SYS_EXIT
	mov	ebx, 0 ; success exit code
	int	0x80
