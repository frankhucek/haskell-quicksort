#include <stdio.h>
#include <stdlib.h>
#include <time.h>
/* Sorts 536870911 random items in 104.707554 seconds */
/* Sorts 1000000 random items in .140216 seconds */

int partition(int **a, int left, int right)
{
    int pivot, i, j, temp;
    int randm = (rand() % (right - left)) + left;
    
    i = left;
    j = right + 1;

    temp = (*a)[randm];
    (*a)[randm] = (*a)[left];
    (*a)[left] = temp;

    pivot = (*a)[left];
    
    while(1)
    {
        do
        {
            i++;
        }while((*a)[i] <= pivot && i <= right);
        do
        {
            j--;
        }while((*a)[j] > pivot);

        if(i >= j)
            break;
        temp = (*a)[i];
        (*a)[i] = (*a)[j];
        (*a)[j] = temp;
        
    }
    
    temp = (*a)[left];
    (*a)[left] = (*a)[j];
    (*a)[j] = temp;
    return j;
}

void quickSortAlg(int **a, int left, int right)
{
    if(left >= right)
        return;

    int j = partition(a, left, right);
    quickSortAlg(a, left, j - 1);
    quickSortAlg(a, j + 1, right);

}



/* -------------------------------------------------------- */
/* Main strictly for testing */
int main(int argv, char* args[])
{
    int arg = atoi(args[1]);
    int *a = (int *)malloc(4*arg);

    int j;
    srand(time(NULL));
    for(j = 0; j < arg; j++)
    {
        a[j] = rand() % arg + 1;
    }
    

    //for(j = 0; j < arg; j++)
    //    a[j] = j;
    for(j = 0; j < arg; j++)
        printf("%d\n",a[j]);
    printf("\n");
    
    clock_t begin, end;
    double time_spent;
    
    begin = clock();
    quickSortAlg(&a,0,arg);
    end = clock();

    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

    int i;
    for(i = 0; i < arg; i++)
    {
        printf("%d\n", a[i]);
    }
    printf("sorted %d elements in %f seconds\n", arg, time_spent);
    return 0;
}
