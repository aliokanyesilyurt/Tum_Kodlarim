void bubble(int arr[],int boyut){
    int i=0,j=0,temp;
    for(i=0;i<boyut-1;i++){
        for(j=0;j<boyut-i-1;j++){
            if(arr[j]>arr[j+1]){
                temp=arr[j+1];
                arr[j+1]=arr[j];
                arr[j]=temp;
            }
        }
    }
}