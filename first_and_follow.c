#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<ctype.h>

int i,n,m,flag=0,k,j;
char a[10][10],f[20],c;

void follow(char c);
void first(char c);

void main()
{
    char c,ch;
    printf("Enter the no of productions:");
    scanf("%d",&n);
    printf("Enter the productions:");
    for(i=0;i<n;i++)
    {
        scanf("%s%c",a[i],&ch);
    }
    printf("The grammar is\n");
    for(i=0;i<n;i++)
        printf("%s\n",a[i]);

do{
    m=0;
    printf("Enter the element whose first and follow is to be found:");
    scanf("%c",&c);
    first(c);
    printf("First(%c)={",c);
    for(i=0;i<m;i++)
        printf("%c,",f[i]);
    printf("}\n");

    m=0;
    strcpy(f," ");
    follow(c);
    printf("Follow(%c)={",c);
    for(i=0;i<m;i++)
        printf("%c,",f[i]);
    printf("}\n");

    printf("Do you want to continue?(1-Yes\t 0-No)");
    scanf("%d",&flag);

}while(flag==1);

}
void first(char c)
{
    if(islower(c))
        f[m++]=c;
    
    for (k=0;k<n;k++)
    {
        if(a[k][0]==c)
        {
            if(a[k][2]=='$')
            {
                follow(c);
            }
            else if(islower(a[k][2]))
            {
                f[m++]=a[k][2];
            }
            else
            {
                first(a[k][2]);
            }
        }
    }
}

void follow(char c)
{
    if(a[0][0]==c)
        f[m++]='$';
    for(i=0;i<n;i++)
        for(j=2;j<strlen(a[i]);j++)
        {
            if(a[i][j]==c)
            {
                if(a[i][j+1]!= '\0')
                    first(a[i][j+1]);
                if( a[i][j+1]=='\0' && a[i][0]!= c)
                    follow(a[i][0]);
            }
        }
}
