#include <stdio.h>

extern int getBit(int,int);
extern int suma(int,int);
extern int mystrlen(char*);
int main(){
    int a=12;
    int b=13;
    int x=0x25;
    int nbit=1;
    printf("EL bit %d del numero %d es %d \n",nbit,x,getBit(x,nbit));
    printf("El resultado de la suma de %d cont %d es: %d\n",a,b,suma(a,b));
    printf("El tamaño del camarones es :%d \n",mystrlen("Camarones"));
}