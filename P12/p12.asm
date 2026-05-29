global mystrlen
global str_mid
global clrBit

section .text
mystrlen:
push ebp
mov ebp,esp
mov edx,0
cont:
mov eax,[ebp+8]
cmp byte[eax+edx],0
JE fin
inc edx
jmp cont
fin:
mov eax,edx
pop ebp
ret

str_mid:
push ebp
mov ebp,esp
push esi
push ebx
mov esi,[ebp+8];out
mov eax,[ebp+12];in
mov edx,[ebp+16];start
mov ecx,[ebp+20];end
cmp ecx,19
JGE Fin
copi:
cmp edx,ecx
jg Fin
mov bl,[eax+edx]
mov [esi],bl
inc edx
inc esi
jmp copi
Fin:
mov byte[esi],0; final de cadena
pop ebx
pop esi
pop ebp
ret

;nota este codigo solo copia de principio a fin de manera continua y nunca cuando el start sea mayor que el end

clrBit:
push ebp 
mov ebp,esp
mov eax,[ebp+8]
mov ecx,[ebp+12]
mov edx,1
shr edx,cl
xor eax,edx
pop ebp
ret