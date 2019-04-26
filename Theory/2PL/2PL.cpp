#include <iostream>
#include <list>
#include <string>
#include <vector>

using namespace std;

#define MAX_OBJECTS 10
#define MAX_TRANSACTIONS 10

struct req
{
	int tr;
	char op;
	int obj;
};

int main()
{
	list<req> requests;
	vector<int>locks(MAX_OBJECTS,0);
	vector<int>hold(MAX_TRANSACTIONS,0);

	char *token;
	req temp;
	// int count=0;
	while(1)
	{
		// count++;

		cin>>temp.tr;

		if(temp.tr==0)
			break;

		cin>>temp.op;

		if(temp.op=='c' && !hold[temp.tr])
		{
			printf("**transaction %d completed**\n\n", temp.tr);	
			for(int i=0;i<MAX_TRANSACTIONS;i++)
				if(locks[i]==temp.tr)
					locks[i]=0;

			list<req>::iterator it;
			vector<int> visited(MAX_TRANSACTIONS,0);

			// for(it=requests.begin();it!=requests.end();++it)
			// 	printf("%d %c %d\n",it->tr,it->op,it->obj);

			for(it=requests.begin();it!=requests.end();)
			{
				if(it->op=='c')
				{
					hold[it->tr]=0;
					visited[it->tr]=1;
					for(int i=0;i<MAX_TRANSACTIONS;i++)
						if(locks[i]==it->tr)
							locks[i]=0;
					printf("**transaction %d completed**\n\n", it->tr);
					requests.erase(it++);
					continue;
				}

				if( (!locks[it->obj] || locks[it->obj]==it->tr) && !visited[it->tr])
					hold[it->tr]=0;

				visited[it->tr]=1;

				if( (!locks[it->obj] || locks[it->obj]==it->tr) && !hold[it->tr])
				{
					printf("%clock(%d) given to %d\n",it->op,it->obj,it->tr);
					printf("%d doing a %c operation on %d\n\n",it->tr,it->op,it->obj);
					locks[it->obj]=it->tr;
					requests.erase(it++);
				}

				else if(!hold[it->tr])
				{
					printf("Conflict for %d with %d on %d\n",it->tr,locks[it->obj],it->obj);
					printf("--Holding %d--\n\n",it->tr);
					hold[it->tr]=1;
					++it;
				}
			}

			continue;
		}
		else if(temp.op=='c')
		{
			temp.obj=0;
			requests.push_back(temp);
			continue;
		}

		cin>>temp.obj;

		if( (!locks[temp.obj] || locks[temp.obj]==temp.tr) && !hold[temp.tr])
		{
			printf("%clock(%d) given to %d\n",temp.op,temp.obj,temp.tr);
			printf("%d doing a %c operation on %d\n\n",temp.tr,temp.op,temp.obj);
			locks[temp.obj]=temp.tr;
		}
		else if(!hold[temp.tr])
		{
			printf("Conflict for %d with %d on %d\n",temp.tr,locks[temp.obj],temp.obj);
			printf("--Holding %d--\n\n",temp.tr);
			hold[temp.tr]=1;
			requests.push_back(temp);
		}
		else
			requests.push_back(temp);

	}

	return 0;
}