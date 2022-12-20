#include <stdio.h>
#define high 8
typedef int numbers[high];
numbers a;


void readarray()
{
    int i;
    for (i = 0; i < high; ++i)
    {
        scanf("%d", &a[i]);  
    }
}

void writearray()
{
    int i;
    for (i = 0; i < high; ++i)
    {
        printf("%d", a[i]);
        printf(" ");
    }
    printf("\n");
}

void exchange(int *x, int *y)
{
    int z;
    z = *x;
    *x = *y;
    *y = z;
}

int partition(numbers a, int y , int z)
{
    int i, j ,x;
    x = a[y];
    i = y - 1;
    j = z + 1;

    while (i < j)
    {
        do 
        {
            j = j - 1;
        }
        while(a[j] > x);
        do
        {
            i = i + 1;
        } while (a[i] < x);
        
        if (i < j)
		    exchange(&a[i], &a[j]);
    }
    return j;

}

void quicksort(numbers a, int m, int n)
{
    int i = 0;
    if (n > m)
    {
        i = partition(a, m, n);
        quicksort(a, m, i);
        quicksort(a, i+1, n);
    }
}


int main()
{    
    readarray();
    quicksort(a, 0, high-1);   
    writearray();
    return 0;
}