#include <stdio.h>
#include <stdlib.h>

typedef struct{
    int a;
    char b;
    int c;
}st1;

typedef struct{
    int a;
    int b;
    char c;
}st2;

typedef struct{
    int a;
    double b;
}st3;

typedef struct{
    double a;
    int b;
}st4;

int main(){
    printf("%d\n",sizeof(st1));
    printf("%d\n",sizeof(st2));
    printf("%d\n",sizeof(st3));
    printf("%d\n",sizeof(st4));
    system("pause");
    return 0;
}