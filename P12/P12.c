#include <stdio.h>

extern int mystrlen(char*);
extern void str_mid(char *, char *, int, int);
extern int clrBit( int value, int nbit);
int main(){
    char cadena[]={"Tamales"};
    char *p=cadena;
    char cad[20];
    char *p2=cad;
    int value=15;
    int nbit=0;
    printf("El tamano de la cadena es %d \n",mystrlen(p));
    str_mid(p2,p,2,5);
    printf("el valor de %d sin el bit %d es %d\n",value,nbit,clrBit(value,nbit));
}