#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
  int seed = (int)time(NULL);
  
  srand(seed);

  int random_number = rand() % 1000;

  printf("\nrandom number: %d\n\n", random_number);

  return 0;
}
