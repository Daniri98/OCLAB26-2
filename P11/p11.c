#include <stdio.h>
#include <stdint.h>

extern void pBin8b(uint8_t);
extern void pBin16b(uint16_t);
extern void pBin32b(uint32_t);
extern void pBin64b(uint64_t);

int main(){
    uint8_t x= 0x5;
    uint16_t y= 0xFEDC;
    uint32_t z= 0xFEDCBA98;
    uint64_t w= 0xFEDCBA987654321F;
        pBin8b(x);
        printf("\n");
        pBin16b(y);
        printf("\n");
        pBin32b(z);
        printf("\n");
        pBin64b(w);
        printf("\n");
    return 0;

}