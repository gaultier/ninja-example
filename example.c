#include "lib.h"
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]) {
  if (argc!=2) return 1;

  char* const s = argv[1];
  const size_t len = strlen(s);
  reverse(s,len);
  upper_case_first(s,len);
  
  printf("%.*s\n", (int)len,s);
}
