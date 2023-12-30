#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
  long seed = (long)time(NULL);
  
  srand(seed);

  long random_number = rand();

  printf("\nrandom number: %ld\n\n", random_number);

  return 0;
}
