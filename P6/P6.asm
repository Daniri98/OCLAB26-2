%include "../LIB/pc_iox.inc"

section .text

global _start:

_start:
;inciso a
mov eax,'a'
call putchar
call saltoLinea
mov ebx,0x5C4B2A60
mov eax,ebx
call pHex_dw
call saltoLinea
add ebx,0x2220359
mov eax,ebx
call pHex_dw
call saltoLinea

;inciso b
mov eax,'b'
call putchar
call saltoLinea
mov eax,esp
call pHex_dw
call saltoLinea
push bx
mov eax,esp
call pHex_dw
call saltoLinea

;inciso c
mov eax,'c'
call putchar
call saltoLinea
mov al,8
mul bl
mov [N],ax
call pHex_w
call saltoLinea

;inciso d
mov eax,'d'
call putchar
call saltoLinea
inc dword [N]
mov ax,[N]
call pHex_w
call saltoLinea

;inciso e
mov eax,'e'
call putchar
call saltoLinea
mov cx,0xFF
mov ax,bx
div cx
call pHex_dw
call saltoLinea
mov eax,edx
call pHex_dw
call saltoLinea

;inciso f
mov eax,'f'
call putchar
call saltoLinea
add edx,[N]
mov eax,edx
call pHex_dw
call saltoLinea

;inciso g
mov eax,'g'
call putchar
call saltoLinea
mov dword[N],edx
dec dword [N]
mov ax, [N]
call pHex_w
call saltoLinea

;inciso h
mov eax,'h'
call putchar
call saltoLinea
mov eax, esp
call pHex_dw
call saltoLinea
pop bx
mov eax,esp
call pHex_dw
call saltoLinea

mov eax,1
xor ebx,ebx
int 0x80

saltoLinea:
push eax
mov al,10
call putchar
pop eax
ret

section .data

N dw 0

