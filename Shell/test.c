#include<unistd.h>
#include<stdio.h>
// 注释
// 还有
// 就这了
//1.c
/*
hello。。。。。。
*/
int fd[2],pid;

int main (){
    pipe(fd);
    printf("%d\t%d\n",fd[0],fd[1]);
    pid = fork();
    if(pid<0){
        printf("fork error\n");
    }
    else if (pid==0){
        close(fd[1]);
        dup2(fd[0],0);
        execlp("grep","grep","D",(char*)0);
    }
    else if(pid>0){
        close(fd[0]);
        dup2(fd[1],1);
    }
    printf("hello world!\nHELLO WORLD!\nHello World!\n");
}
