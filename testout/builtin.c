#include <stdio.h>
#include <stdlib.h>
void print(char * x){
    printf(x);
}

void println(char * x){
    printf("%s\n",x);
}

void printInt(int x){
    printf("%d",x);
}

void printlnInt(int x){
    printf("%d\n",x);
}

int getInt(){
    int n;
    scanf("%d",&n);
    return n;
}

char * toString(int n){
    // int32_max: 2147483647 total digits: 10 + 1 + 1 = 12;
    char * newString = (char * ) malloc(13);
    sprintf(newString,"%d",n);
    return newString;
}

char * getString(){
    char * newString = (char *) malloc(sizeof(char) * 1024);
    scanf("%s",newString);
    return newString;
}

char * _f__malloc(int n) {
    return (char *) malloc(n);
}
