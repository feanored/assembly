section .data
msg: 	db 	"Hello Binha, deusa do Fogo!", 10
.len: 	equ $-msg

section .text
global _start

_start:
	mov rax, 1				; syscall code for write
	mov rdi, 1 				; stdout file id
	mov rsi, msg
	mov rdx, msg.len
	syscall

	mov rax, 60				; syscall code for exit
	xor rdi, rdi
	syscall
