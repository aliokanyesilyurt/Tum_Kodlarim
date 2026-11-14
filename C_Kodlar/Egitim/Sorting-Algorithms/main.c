#include <stdio.h>
#include <stdlib.h>
#include "bubble.h"
#include "exchange.h"
#include "selection.h"
#include "insertion.h"
#include "quick.h"
int main(){
    int choice;
    int arr[30];
    int i,boyut;

    printf("ARRAY ENTRANCE\n");
    printf("--------------\n");
    printf("Please enter your array size: ");
    scanf("%d",&boyut);

    printf("Please enter your array: \n");
    for(i=0;i<boyut;i++){
    printf("arr[%d]: ",i);
    scanf("%d",&arr[i]);
    }
    if(boyut > 30) {
        printf("Max 30, size equals to 30 now.\n");
        boyut = 30;
    }
    printf("---\n\n");
    printf("SORT MENU\n");
    printf("---------\n");
    printf("1-Bubble\n2-Selection\n3-Exchange\n4-Insertion\n5-Quick\n");
    printf("---------\n");
    printf("You've selected: ");
    scanf("%d",&choice);
    switch(choice){
        case 1: bubble(arr,boyut); break;
        case 2: selection(arr,boyut); break;
        case 3: exchange(arr,boyut); break;
        case 4: insertion(arr,boyut); break;
        case 5: quick(arr, 0, boyut - 1); break;
        default: printf("You entered wrong number, returning!\n"); system("pause"); return 0;
    }
    i=0;
    printf("\nSORTED ARRAY\n------------\n");
    for(i=0;i<boyut;i++){
        printf("arr[%d]=%d\n",i,arr[i]);
    }
    printf("---\n");
    system("pause");
    return 0;
}