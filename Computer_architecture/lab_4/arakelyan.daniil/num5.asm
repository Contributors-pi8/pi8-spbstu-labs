.model small
.stack 100h

.data
    message_data db 'Message from DATA segment$', 0

.code
start:

    mov ax, @data
    mov ds, ax

    ; message data seg
    mov ah, 09h
    lea dx, message_data
    int 21h

    ; next line
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ; code segment
    mov ax, cs
    mov ds, ax

    ; message code seg
    mov ah, 09h
    lea dx, message_code
    int 21h

    mov ah, 4Ch
    int 21h

message_code db 'Message from CODE segment$', 0
end start
