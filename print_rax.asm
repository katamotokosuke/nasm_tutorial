section .data
codes: db '0123456789ABCDEF'

section .text
global _start
_start:
 mov rax, 0x1122334455667788
 mov rdi, 1
 mov rdx, 1
 mov rcx, 64

; 4ビットを16進の1桁として出力するために
; シフトと論理和によって1桁のデータを得る
; その結果はcodes配列へのオフセットである。
.loop:
 push rax
 sub rcx, 4 ;rcx - 4 -> rcx
 sar rax, cl ; clだけ右シフト
 and rax, 0xf

 lea rsi, [codes + rax]
 mov rax, 1

 ;;syscallでrcxとr11が変更される
 push rcx
 syscall
 pop rcx
 pop rax
 test rcx, rcx ; ゼロ?
 jnz .loop

 mov rax, 60
 xor rdi, rdi
 syscall
