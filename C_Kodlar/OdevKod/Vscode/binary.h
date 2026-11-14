#include "ayarlar.h"

void binary(unsigned char number){ // Binary yazdırma fonksiyonu.
    int i,k;
    for(i=7;i>=0;i--){
        k=number>>i; // En sağa getirdik biti ki karşılaştıralım.
        if ((k&1)==1) printf("1");
        else printf("0");
        if(i==5 || i==2) printf(" "); // Okunabilirlik için boşluk.
    }
    printf("\n");
}