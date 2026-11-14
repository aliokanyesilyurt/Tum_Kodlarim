void insertion(int arr[],int boyut){
    // Değişkenleri tanımla.
    // İlk değişkenini sıralı kabul et ve ikinciyi seç.
    // İkinci değişkenini ilk değişkenle karşılaştırıp yerleştir. 
    // Sıralama olunca 3.ye bak ve onu ikinci ile karşılaştır.
    // İkinciden küçükse birinciyle karşılaştır.
    // Birinciden büyükse ikincinin soluna yerleştir ve böyle devam et.
    // {12,34,54,36,78,13}
    int i,j,key;
    for(i=1;i<boyut;i++){
        key=arr[i];
        j=i-1;
        while(j>=0 && arr[j]>key){
            arr[j+1]=arr[j];
            j--;
        }
        arr[j+1]=key;
    }
}