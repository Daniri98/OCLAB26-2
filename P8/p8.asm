%include "../LIB/pc_iox.inc"

section .text
global _start:

_start:
;a
sigue:call getche
cmp al, '0'
JL sigue
cmp al, '9'
JA sigue
cmp al,'5'
JAE sig
call saltoLinea
mov edx, msg
call puts
sig:call saltoLinea


;b
numlet:call getche
call saltoLinea
cmp al,'9'
JA let
cmp al,'0'
JAE num
let:cmp al,'A'
JB sssig
cmp al,'Z'
JA numlet
mov edx,LET
call puts
jmp sssig
num:mov edx,NUM
call puts
sssig:call saltoLinea

;c
xor eax,eax
mov edx,mensajito
call puts
call saltoLinea
captt:call getche
cmp al,'0'
JB captt
cmp al,'9'
JNA capturado
cmp al,'A'
JNE captt
capturado:sub al,'0'
call saltoLinea
mov si,1
mov bx,ax
traingulo:mov cx,si
joint:mov al,'*'
call putchar
loop joint
call saltoLinea
inc si
mov cx,bx
dec bx
loop traingulo


;d
mov cx,10
mov edx,arreglo
mov esi,0
arrereg:call getche
mov byte[edx+esi],al
inc esi
loop arrereg
call saltoLinea
mov cx,10
mov esi,0
despl:mov al,edx[esi]
call putchar
call saltoLinea
inc esi
loop despl

mov eax,1
mov ebx,0
int 0x80

saltoLinea:
push eax
mov al,10
call putchar
pop eax
ret

section .data

msg db 'Menor a 5',0xa, 0
NUM db 'Es un numero',0xa,0
LET db 'Es una letra',0xa,0
mensajito db 'Introduzca su numero en hexadecimal Maximo 10 A',0xa,0

section .bss
arreglo resb 10