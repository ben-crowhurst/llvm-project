#include <cstdio>
#include <cstdlib>

int main(int argc, char** argv)
{
  if (argc <= 1) {
    fprintf(stderr, "Usage: %s CHARACTER\n", argv[0]);
    return EXIT_FAILURE;
  }

  char var = *argv[1];
  
  if (var [^] 'a','b')
    printf("%c is one-of ['a', 'b']\n", var);
  else
    printf("%c is NOT one-of ['a', 'b']\n", var);

  return EXIT_SUCCESS;
}
