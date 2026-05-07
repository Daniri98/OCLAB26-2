%include "../LIB/pc_iox.inc"
global _start

section .data
inval db 'Invalido introduce otro caracter',0xa,0
fuera db 'El valor esta fuera del rango',0xa,0
intro db 'Introdusca los valores del vector',0xa,0
tamano db 'Introdusca el tamano de sus vectores en hexa',0xa,0
N db 0
section .bss
vector1 resB 10
vector2 resB 10

section .text
_start:
mov edx,tamano
call puts   
call CambioLinea
call Captam
xor ecx,ecx
mov cl,[N]
call Check
cmp al,1
JE fin
mov edx,intro
call puts
call CambioLinea
mov ebx,vector1
call introduvector
mov edx,intro
call puts
call CambioLinea
mov ebx,vector2
call introduvector
mov ebx,vector1
mov edx,vector2
call ProductoEscalarVector

fin:
xor ebx,ebx
mov eax,1
int 0x80  




introduvector:
push ecx
push eax
push edx
push esi
captura:  call getch
    cmp al,'0'
    JB invalido
    cmp al,'9'
    JA invalido
    sub eax,030h
    mov byte[ebx+esi],al
    inc esi
    jmp continuar
    invalido   mov edx,inval
    call puts
    jmp captura
    continuar:
   loop captura
   pop esi
   pop edx
   pop eax
   pop ecx
ret

Captam:
push eax
push edx
    call getch
    cmp al,'1'
    JB inv
    cmp al,'9'
    JBE num
    cmp al,'A'
    JE diez
    inv:   mov edx,inval
    call puts
    call CambioLinea
    jmp regreso
    diez:sub eax,07h
    num:sub eax,030h
    regreso:
    mov [N],al
pop edx
pop eax
ret

Check: 
push edx
    cmp ecx,10
    JA fue
    cmp ecx,1
    JAE valido
    fue:
    mov edx,fuera
    call puts
    call CambioLinea
    mov al,1
    valido:
pop edx
ret
CambioLinea:
push eax
    mov al,10
    call putchar
pop eax
ret
Desplvector:
push ecx
push eax
push esi
    despc mov eax,[ebx+esi]
    inc esi
    call pHex_b
    call CambioLinea
    loop despc
pop esi
pop eax
pop ecx
ret

ProductoEscalarVector:
push ecx
push ebx
push edx
push esi
push eax
push edi
xor esi,esi
xor edi,edi
    multiplicar:
    mov al,edx[esi]
    mul byte ebx[esi]
    add edi,eax
    inc esi
    loop multiplicar
    mov eax,edi
    call pHex_b
pop edi
pop eax
pop esi
pop edx
pop ebx
pop ecx
call CambioLinea
    
ret