#include <stdio.h>
#include <stdlib.h>
void binary(int);
// 1. Sayı girişlerini al. (2 sayı)
int main(){
    int sayi1,sayi2,kaydir,islem,bit,islem2;
    printf("BITWISE HESAP MAKINESI\n");
    printf("######################\n");
    printf("Lutfen 1 adet sayi giriniz: ");
    scanf("%d",&sayi1);
// 2. Menüyü aç yapılacak işlemi seçtir.
    printf("----------------------\n");
    printf("MENU\n");
    printf("1. n birim saga kaydir\n");
    printf("2. n birim sola kaydir\n");
    printf("3. n. biti yak\n");
    printf("4. n. biti sondur\n");
    printf("5. n. biti tersle\n");
    printf("6. iki sayiyi karsilastir\n");
    printf("7. Cikis yap\n");
    printf("-----------------------\n");
    printf("Yapicaginiz islemi secin: ");
    scanf("%d",&islem);
// 3. İşlemlerin yapıldığı switch-case'i yaz.
    switch(islem){
        case 1: printf("Saga kaydiriliyor...\n");
                printf("Kaydiracaginiz miktari girin: ");
                scanf("%d",&kaydir);
                printf("1. sayi: %d >> %d = %d\n",sayi1,kaydir,sayi1>>kaydir);
                binary(sayi1>>kaydir);
                break;
        case 2: printf("Sola kaydiriliyor...\n");
                printf("Kaydiracaginiz miktari girin: ");
                scanf("%d",&kaydir);
                printf("1. sayi: %d >> %d = %d\n",sayi1,kaydir,sayi1<<kaydir);
                binary(sayi1<<kaydir);
                break;
        case 3: printf("Bit yakiliyor...\n");
                printf("Yakacaginiz biti secin (0-7): ");
                scanf("%d",&bit);
                sayi1 = sayi1 | (1<<bit);
                printf("Sonuc = %d\n",sayi1);
                binary(sayi1);
                break;
        case 4: printf("Bit sonduruluyor...\n");
                printf("Sondureceginiz biti secin (0-7): ");
                scanf("%d",&bit);
                sayi1 = sayi1 & ~(1 << bit);
                printf("Sonuc = %d\n",sayi1);
                binary(sayi1);
                break;
        case 5: printf("Bit tersleniyor...\n");
                printf("Terslenecek biti secin (0-7): ");
                scanf("%d",&bit);
                sayi1 = sayi1 ^ (1 << bit);
                printf("Sonuc = %d\n",sayi1);
                binary(sayi1);
                break;
        case 6: printf("Sayilar karsilasitiriliyor...\n");
                printf("Ikinci sayiyi girin: ");
                scanf("%d",&sayi2);
                printf("Isleminizi secin\n");
                printf("1.(&)\n2.(|)\n3.(^)\n");
                scanf("%d",&islem2);
                switch(islem2){
                    case 1: printf("%d & %d = %d",sayi1,sayi2,sayi1&sayi2);
                            binary(sayi1&sayi2);
                            break;
                    case 2: printf("%d | %d = %d",sayi1,sayi2,sayi1|sayi2); 
                            binary(sayi1|sayi2);
                            break;
                    case 3: printf("%d ^ %d = %d",sayi1,sayi2,sayi1^sayi2); 
                            binary(sayi1^sayi2);
                            break;
                    default: printf("Yanlis giris!\n");
                    system("pause");
                    return 0;
                }
        case 7: printf("Cikis yapiliyor...\n");
                system("pause");
                return 0;
        default: printf("Yanlis giris!\n");
                 system("pause");
                 return 0;
    }           
    system("pause");
    return 0;
}
// 4. Yazılan sayıları binary olarak gösteren fonksiyonu yaz.
void binary(int sayi){
    int i,k;
    for(i=7;i>=0;i--){
        k=sayi>>i;
        if ((k&1)==1) printf("1");
        else printf("0");
    }
    printf("\n");
}