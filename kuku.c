#include <stdio.h>

int main()
{
	int i;
	int j;
	
	printf("<!DOCTYPE html>\n");
	printf("<meta charset=\"UTF-8\">\n");
	printf("<title>99</title>\n");
	printf("<h1>99</h1>\n");
	printf("<table>\n");
	printf("<tr>\n");
	
	for (i = 0 ; i < 10 ; ++i)
	{
		if (i == 0) printf("<th>\n");
		else printf("<th>%d\n",i);
	}

	for ( i = 1 ; i < 10 ; ++i)
	{
		printf("<tr>\n");
		printf("<th>%d\n",i);
		for( j = 1; j < 10 ; ++j)
		{
			printf("<td>%d\n" , i* j);
		}
	}
	return 0;
}