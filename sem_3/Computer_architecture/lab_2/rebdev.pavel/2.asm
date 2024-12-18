global _start
section .data
  arr db 70, 71, 72, 73, 74, 75, 76, 77, 78, 79
  arr2 db 10 dup(80)
section .text
  print:
    mov [toPrint], ax
    mov eax, 4
    mov ebx, 1
    mov ecx, toPrint
    mov edx, 1
    int 0x80
    ret

  printTemplate:
    mov rcx, 10
    fullPrint:
      mov ax, [rbx]
      add rbx, 1
      push rcx
      push rbx
      call print
      mov ax, 32
      call print
      pop rbx
      pop rcx
      loop fullPrint
    mov ax, 10
    call print
    ret

  _start:
    mov rbx, arr
    call printTemplate
    mov rbx, arr2
    call printTemplate

    cld
    lea esi, arr
    lea edi, arr2
    mov ecx, 10
    rep movsb

    mov rbx, arr2
    call printTemplate

    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
  toPrint resb 1
