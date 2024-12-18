global _start
section .data
section .text
  _start:

    mov rbx, dopNum		;move rbx, to avoid a segment error

    add rax, rbx
    add rax, [rbx]
    add rax, [rbx + rsi]
    add rax, [rbx + rsi + 12]

    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
  dopNum resb 1
