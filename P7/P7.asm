%include "../LIB/pc_iox.inc"

extern pBin_b
extern pBin_w
extern pBin_dw
section .text

global _start:

_start:

;inciso a
mov eax,'a'
call putchar
call saltoLinea
mov eax,0x22446688
ror eax,4
call pHex_dw
call saltoLinea
call pBin_dw
call saltoLinea

;inciso b
mov eax,'b'
call putchar
call saltoLinea
mov cx, 0x3F48
shl cx,2
shr cx,3
shl cx,4
mov ax,cx
call pHex_w
call saltoLinea
call pBin_w
call saltoLinea

;inciso c
mov eax,'c'
call putchar
call saltoLinea
mov esi,0x20D685F3
xor esi,0x60062021
mov eax,esi
call pHex_dw
call saltoLinea
call pBin_dw
call saltoLinea

;inciso d
mov eax,'d'
call putchar
call saltoLinea
mov eax,esp
call pHex_dw
call saltoLinea
push esi
mov eax,esp
call pHex_dw
call saltoLinea

;inciso e
mov eax,'e'
call putchar
call saltoLinea
mov ch,0xA7
or ch,0x68
mov al,ch
call pHex_b
call saltoLinea
call pBin_b
call saltoLinea

;inciso f
mov eax,'f'
call putchar
call saltoLinea
mov bp,0x67DA
and bp,0x2388
mov ax,bp
call pHex_w
call saltoLinea
call pBin_w
call saltoLinea

;inciso g
mov eax,'g'
call putchar
call saltoLinea
shr bp,3
mov ax,bp
call pHex_w
call saltoLinea
call pBin_w
call saltoLinea

;inciso h
mov eax,'h'
call putchar
call saltoLinea
mov ebx,0xFFABFFCD
shr ebx,5
mov eax,ebx
call pHex_dw
call saltoLinea
call pBin_dw
call saltoLinea

;inciso i
mov eax,'i'
call putchar
call saltoLinea
and ecx,0x0000FFFF
shl ecx,3
mov eax,ecx
call pHex_dw
call saltoLinea

;inciso j
mov eax,'j'
call putchar
call saltoLinea
mov eax,esp
call pHex_dw
call saltoLinea
pop esi
mov eax,esp
call pHex_dw
call saltoLinea

;inciso k
mov eax,'k'
call putchar
call saltoLinea
mov ebx,esi
shl esi,3
shr ebx,1
add esi,ebx
mov eax,esi
call pHex_dw
call saltoLinea

mov eax,1
mov ebx,0
int 0x80

saltoLinea:
push eax
mov al,10
call putchar
pop eax
ret
