#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/wait.h>


void pt(void);
void remove_space(char * s);
int run_tools(char * s);


int main (void)
{
	printf("my_shell is running\n\n");
	//pt();
	pid_t id;
	char s[20] ;
	
begin:;
	pt();
	fgets(s,19,stdin);
	s[strlen(s)-1]='\0';
	if(run_tools(s))
		goto begin;

	if((id=fork())==0){
		//child
		system(s);
		exit(0);
	}else if(id>0){
		//father
		wait(NULL);
		//printf("father is here...\n");
		goto begin;
	}else{
		//fork failed
		printf("fork failed...");
	}
	
}


//print tag on the screen
void pt(void){
	printf("$my_shell >>> ");
}

void remove_space(char *s){
	int i,j;
	i=j=0;
	for(;s[i];i++){
		if(s[i]!=' '&&s[i]!='\t')
			s[j++]=s[i];
	}
	s[j]='\0';
}

int run_tools(char * s){
	//return 0 if not run a tool
	//return 1 if s is a tool
	if(!strcmp(s,"exit")){
		puts("exit my_shell...\n");
		exit(0);
		return 1;
	}
	else if(!strcmp(s,"help")){
		pid_t id;
		if((id=fork())==0){
			//child
			FILE * f = fopen("my_shell.help","r");
			char c;
			while((c=fgetc(f))!=EOF)
				putchar(c);
			exit(0);			
		}
		else if(id>0){
			//father
			wait(NULL);
		}
		else{
			//sothing wrong...
			printf("fork failed...");
		}
		
		// run a tool and restart ...
		return 1;
	}
	
	else{return 0;}
}
