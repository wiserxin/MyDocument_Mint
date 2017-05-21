#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/wait.h>


void pt(void);
int try_execl(char * input);
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
	remove_space(s);
	if(run_tools(s))
		goto begin;

	if((id=fork())==0){
		//child
		try_execl(s);
		printf("child exec failed ...\n");
		printf("child finish ...\n");
		
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

int try_execl(char * input){
		int i=0;
		char path[30];
		char *p [8]={
					 "/usr/local/sbin/",
					 "/usr/local/bin/",
					 "/usr/sbin/",
					 "/usr/bin/",
					 "/sbin/",
					 "/bin/",
					 "/usr/games/",
					 "/usr/local/games/"};//short path
// all path is : /usr/local/sbin: /usr/local/bin: /usr/sbin: /usr/bin: /sbin: /bin: /usr/games: /usr/local/games:
		//puts(input);
		/*char local_path [128];
		getcwd(local_path,sizeof(local_path)-2);
		local_path[126]=0;
		local_path[strlen(local_path)+1]='\0';
		local_path[strlen(local_path)]='/';
		puts(local_path);*/
		//puts("hello--0");
		//正常无参指令
		for (i=0;i<8;i++){
			strcpy(path,p[i]);
			strcpy(path+strlen(p[i]),input);
			if(execl(path,input,NULL)<0)
				//printf("fail %d\n",i);
				;
				
		}		
		
		//puts("hello--1");
		
		//带 > 的指令
		char * split;
		if((split=strchr(input,'>'))!=NULL){
			//puts("has a >");
			*split='\0';
			FILE *pp;
			FILE * file = fopen(split+1,"w");
			
			if( (pp = popen(input, "r")) == NULL )
			{
				 printf("popen() error!/n");
				 exit(1);
			}
			wait(NULL);
			
			char buf[128];
			while(fgets(buf, sizeof buf, pp))
			{
                 //printf("in >>> %s", buf);
                 fputs(buf,file);
			}
			fclose(file);
			pclose(pp);
			exit(0);
			
		}
		
		//带 < 的指令
		if((split=strchr(input,'<'))!=NULL){
//			printf("&input is 0x%x\n&split is 0x%x\n",input,split);
			*split='\0';
			
			FILE *pp;
			FILE * file = fopen(split+1,"r");
			
			puts(input);
			puts(split+1);
			if( (pp = popen(input, "w")) == NULL )
			{
				 printf("popen() error!/n");
				 exit(1);
			}
			
			char buf[128];
			while(fgets(buf, sizeof buf, file))
			{
                 //printf("in >>> %s", buf);
                 fputs(buf,pp);
			}
			fclose(file);
			pclose(pp);
			wait(NULL);
			exit(0);
			
		}
		
		//带 | 的指令
		if((split=strchr(input,'|'))!=NULL){
			*split='\0';
			FILE *pp;
			FILE * file = fopen("my_shell.temp","w");
			
			if( (pp = popen(input, "r")) == NULL )
			{
				 printf("popen() error!/n");
				 exit(1);
			}
			wait(NULL);
			
			char buf[128];
			while(fgets(buf, sizeof buf, pp))
			{
                 //printf("in >>> %s", buf);
                 fputs(buf,file);
			}
			fclose(file);
			pclose(pp);
			sleep(0.5);
			
			file = fopen("my_shell.temp","r");
			if( (pp = popen(split+1, "w")) == NULL )
			{
				 printf("popen() error!/n");
				 exit(1);
			}
			

			while(fgets(buf, sizeof buf, file))
			{
                 //printf("in >>> %s", buf);
                 fputs(buf,pp);
			}
			fclose(file);
			pclose(pp);
			wait(NULL);
			exit(0);
			
		}
		

/*
		if(split=strchr(input,'|')){
			for (i=0;i<8;i++){
				strcpy(path,p[i]);
				*split='\0';
				strcpy(path+strlen(p[i]),input);
				// *split='|';
				if(execl(path,input,">",split+1,NULL)<0)
					//printf("fail 1\n");
					;
			}
		}
*/		
		return 0;	
}
