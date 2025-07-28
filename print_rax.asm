section .data
codes: 		db 		'0123456789ABCDEF'
newline: 	db  	10

section .text
global _start

_exit:
	; prints newline
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	; and exits
	mov rax, 60
	xor rdi, rdi
	syscall

_start:
	mov rax, 0x1122334455667788
	mov rdi, 1
	mov rdx, 1
	mov rcx, 64
.loop:
	push rax
	sub rcx, 4
	sar rax, cl
	and rax, 0xF

	lea rsi, [codes + rax]
	mov rax, 1

	push rcx
	syscall ; syscall changes rcx (and r11)
	pop rcx

	pop rax
	test rcx, rcx
	jnz .loop
	jmp _exit
