void selection(int arr[],int boyut){
    // 1. Değişkenleri tanımla.
    // 2. İlk değişkeni al tüm diziyle karşılaştır.
    // 3. En küçük olan değişkeni bu sırada belirle.
    // 4. En küçük değişkeni en başa al.
    // 5. Tekrarla.

    int i=0,j=0,min_pos,temp;

    for(i=0;i<boyut-1;i++){
            min_pos=i;
        for(j=i+1;j<boyut;j++){
            if(arr[j]<arr[min_pos]){
                min_pos=j;
            }
        }
        if(min_pos!=i){
            temp=arr[i];
            arr[i]=arr[min_pos];
            arr[min_pos]=temp;
        }
    }
}