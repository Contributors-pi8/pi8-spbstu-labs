global _start
numOfEl equ 5
section .data
  arr dw 1, 20, 300, 4000, 50000
  arr2 dw numOfEl dup(0)
section .text
  print:
    mov [toPrint], ax		; put ax in toPrint
    mov eax, 4			; sys call for sys_write
    mov ebx, 1			; file descriptor 1 (stdout)
    mov ecx, toPrint		; pointer to the character to print
    mov edx, 1			; length of the output
    int 0x80; call kernel
    ret

  printBigNum:
    mov rcx, 0
    decomposition:
      mov bx, 10
      mov dx, 0
      div bx			; ax = dx:ax / bx; dx = ax % bx
      push dx
      add rcx, 1; ++rcx
      cmp ax, 0			; (ax > 0) ? (ZF = 1) : (ZF = 0)
      jnz decomposition		; while (ZF != 1) call jmp decomposition
    outputLoop:
      pop ax
      add ax, '0'		; char(9) is '\t', but char(9 + '0') is '9'
      push rcx
      call print
      pop rcx
      loop outputLoop
    ret
  printTemplate:
    mov rcx, numOfEl		; number of elements in array
    fullPrint:
      mov ax, [rbx]; ax = *rbx
      add rbx, 2; ++rbx
      push rcx
      push rbx
      call printBigNum
      mov ax, 32; char(32) = ' '
      call print
      pop rbx
      pop rcx
      loop fullPrint
    mov ax, 10; char(10) = '\n'
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

    mov eax, 1			; sys call for sys_exit
    mov ebx, 0			; exit status
    int 0x80			; call kernel

section .bss
  toPrint resb 1
