global _start

section .text
_start:
 mov rax, 1; write
 mov rdi, 1; file handle
 mov rsi, message
 mov rdx, 13; number of bytes
 syscall
 mov rax, 60;exit
 syscall

section .data
message: db "Hello World", 10
