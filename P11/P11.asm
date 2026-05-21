global pBin8b
global pBin16b
global pBin32b
global pBin64b

section .text

myputchar:
pushad
push eax
mov eax,4
mov ebx,1
mov ecx,esp
mov edx,1
int 80h
pop eax
popad
ret

pBin8b:
push ebp
mov ebp,esp
push ebx
mov bl,ebp[8]
mov ecx,8
mover:
mov eax,0
shl bl,1
adc eax,30h
call myputchar
loop mover
pop ebx
pop ebp
ret

pBin16b:
push ebp
mov ebp,esp
push ebx
mov bx,ebp[8]
mov ecx,16
moverr:
mov eax,0
shl bx,1
adc eax,30h
call myputchar
loop moverr
pop ebx
pop ebp
ret

pBin32b:
push ebp
mov ebp,esp
push ebx
mov ebx,ebp[8]
mov ecx,32
moverrr:
mov eax,0
shl ebx,1
adc eax,30h
call myputchar
loop moverrr
pop ebx
pop ebp
ret


pBin64b:
push ebp
mov ebp,esp
push ebx
mov ebx,ebp[12]
push ebx
call pBin32b
pop ebx
mov ebx,ebp[8]
push ebx
call pBin32b
pop ebx
pop ebx
pop ebp
ret
