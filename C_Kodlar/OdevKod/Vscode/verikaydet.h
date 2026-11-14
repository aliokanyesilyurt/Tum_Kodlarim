#include "header.h"

void verikaydet(bnoConfig newConfig){ 
FILE* fptr;
fptr=fopen("bnosave.txt","w"); // Dosyayı açtık

    if(fptr==NULL){
        printf("Dosya acimi basarisiz oldu!\n");
        system("pause");
        return; // Dosya açık mı kontrol etmek zorundayız.
}
    fprintf(fptr, "=== BNO55 CONFIGURATION ===\n");
    
    fprintf(fptr,"[SETTINGS]\n");
    fprintf(fptr,"G Range (Enum) = %d\n", newConfig.range); // Yazdırma işlemini yapıyoruz.
    fprintf(fptr,"Bandwidth (Enum) = %d\n", newConfig.bw);
    fprintf(fptr,"Operation Mode (Enum) = %d\n\n", newConfig.mode);

    fprintf(fptr,"[REGISTER VALUE]\n"); // Normal yazdırmadan tek farkı dosyaya yazdırma.
    fprintf(fptr,"Hexadecimal = 0x%x\n", newConfig.value);
    fprintf(fptr,"Decimal = %d\n", newConfig.value);    
    fprintf(fptr,"Binary = 0b ");
    int i,k;
    for(i=7;i>=0;i--){
        k=newConfig.value>>i; // En sağa getirdik biti ki karşılaştıralım.
        if ((k&1)==1) fprintf(fptr,"1");
        else fprintf(fptr,"0");
        if(i==5 || i==2) fprintf(fptr," "); // Okunabilirlik için boşluk.
    }
    fprintf(fptr, "\n===");

    fclose(fptr); // Dosyayı kapattık.
}

