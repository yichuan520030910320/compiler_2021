#include<stdio.h>
#include<stdlib.h>
#include<string.h>
//because c doesn't contain bool literal
#include<stdbool.h>

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

int _str_ord(const char* str,int pos){
    return str[pos];
}

bool _str_eq(const char* lhs,const char* rhs){
    return strcmp(lhs,rhs)==0;
}
bool _str_ne(const char* lhs,const char* rhs){
    return strcmp(lhs,rhs)!=0;
}
bool _str_lt(const char* lhs,const char* rhs){
    return strcmp(lhs,rhs)<0;
}
bool _str_le(const char* lhs,const char* rhs){
    return strcmp(lhs,rhs)<=0;
}
bool _str_gt(const char* lhs,const char* rhs){
    return strcmp(lhs,rhs)>0;
}
bool _str_ge(const char* lhs,const char* rhs){
    return strcmp(lhs,rhs)>=0;
}
//for string add
const char*_str_concatenate(const char* lhs,const char* rhs){
    char* buf=malloc(sizeof(char)*1024);
    strcpy(buf,lhs);
    strcat(buf,rhs);
    return buf;
}

//todo
char * _f__malloc(int n) {
    return (char *) malloc(n);
}


//todo  parseint substring length