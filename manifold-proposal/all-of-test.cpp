#include <cstdio>
#include <cstdlib>

char fn1() { return 'a'; }
char fn2() { return 'a'; }

int main(int argc, char** argv)
{
  if (argc <= 1) {
    fprintf(stderr, "Usage: %s CHARACTER\n", argv[0]);
    return EXIT_FAILURE;
  }

  char var = *argv[1];
  
  if (var [&] fn1(), fn2())
    printf("%c is all-of [fn1(), fn2()]\n", var);
  else
    printf("%c is NOT all-of [fn1(), fn2()]\n", var);

  return EXIT_SUCCESS;
}
