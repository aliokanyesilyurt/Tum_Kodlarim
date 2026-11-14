void exchange(int arr[],int boyut){
    int i=0,j=0;
    int temp;
    for(i=0;i<boyut-1;i++){
        for(j=i+1;j<boyut;j++){
            if(arr[i]>arr[j]){
                temp=arr[j];
                arr[j]=arr[i];
                arr[i]=temp;
            }
        }
    }
}