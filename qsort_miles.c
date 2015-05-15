#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void quick_sort (int *a, int n) {
    int i, j, p, t;
    if (n < 2)
        return;
    p = a[n / 2];
    for (i = 0, j = n - 1;; i++, j--) {
        while (a[i] < p)
            i++;
        while (p < a[j])
            j--;
        if (i >= j)
            break;
        t = a[i];
        a[i] = a[j];
        a[j] = t;
    }
    quick_sort(a, i);
    quick_sort(a + i, n - i);
}

int main () {
  int a [1000000];
  int i;
  int n = sizeof a / sizeof a[0];

  for (i = 0; i < n; i++)
    a[i] = rand() % 1000000;

  /* for (i = 0; i < n; i++) */
  /*   printf("%d%s", a[i], i == n - 1 ? "\n" : " "); */
  quick_sort(a, n);
  /* for (i = 0; i < n; i++) */
  /*   printf("%d%s", a[i], i == n - 1 ? "\n" : " "); */
  return 0;
}
