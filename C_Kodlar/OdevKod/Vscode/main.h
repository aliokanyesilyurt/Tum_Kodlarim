#include "header.h"
#include "verikaydet.h" 
int main() { // Ana fonksiyonumuz 0 veya 1 olacak bir cevap döndürüyor bu yüzden int.

    bnoConfig newConfig; // Struct ismi.

    // Veri girişlerini elle yazdık dışarıdan almadık her şey belli.
    newConfig.range=RANGE_8G;
    newConfig.bw=BW500;
    newConfig.mode=NORMAL;
    newConfig.value=(newConfig.mode<<5) |
                    (newConfig.bw<<2) |
                    (newConfig.range);

    printf("=== BNO55 CONFIGURATION ===\n");
    printf("[SETTINGS]\n"); // Ekrana yazdırma işlemini yapıyoruz.
    printf("G Range (Enum) = %d\n",newConfig.range);
    printf("Bandwith (Enum) = %d\n",newConfig.bw);
    printf("Operation Mode = NORMAL\n");
    printf("\n");

    printf("[REGISTER VALUE]\n");
    printf("Decimal = %d\n",newConfig.value);
    printf("Hexadecimal = 0x%x\n",newConfig.value);
    printf("Binary = 0b ");
    binary(newConfig.value); // Binary yazdırma fonksiyonumuzu kullandık.
    printf("\n===\n");

    verikaydet(newConfig);
    // Ödevde istenmemiş olsa da bu tür işlemlerde yaptıklarımızı
    // bir yere kaydetmemiz gerekiyor normalde ileride de isteneceğini
    // düşünerek konuyu tekrar etmiş olmak adına amelelik de olsa bunu da yaptım.

    system("pause");
    return 0;
}
