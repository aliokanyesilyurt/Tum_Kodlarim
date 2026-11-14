// 1. Parçalama Fonksiyonu
void quick(int arr[],int low,int high){
    int temp,i,j,pivot;
    i=low-1;
    pivot=arr[high];
    if(low<high){
    for(j=low;j<high;j++){
        if(arr[j]<pivot){
            i++;
            temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
        }
    }
    int pi=i+1;
    temp=arr[pi];
    arr[pi]=pivot;
    arr[high]=temp;
    // 2. Recursion Kısmı
    quick(arr, low, pi - 1);
    quick(arr, pi + 1, high);
}
}
