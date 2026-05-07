global getBit
global suma
global _start:
global mystrlen
section .text

getBit:
push ebp
mov ebp,esp
mov ecx,[ebp+12] ;numbit
mov eax,[ebp+8]  ;numero
inc ecx
rcr eax,cl
JC uno
mov eax,0
jmp fin
uno:
mov eax,1
fin:
pop ebp
ret

suma:
push ebp
mov ebp,esp
mov eax,[ebp+8] ;a
mov ecx,[ebp+12] ;b 
add eax,ecx
pop ebp
ret

mystrlen:
push ebp
mov ebp,esp
mov ecx,[ebp+8]
seguir: mov al,[ecx+edx]
cmp al,0
JE salir
inc edx
jmp seguir
salir:
mov eax,edx
pop ebp
ret