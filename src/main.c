#include <stdio.h>

/**
F=./test.filea /proc/sys/vm/drop_caches; echo 3 | sudo tee /proc/sys/vm/drop_caches; strace --syscal
l-times=us ./a.out $F 2>&1 | grep seek
**/

/**
https://stackoverflow.com/questions/38024736/how-to-estimate-the-seek-speed-in-file-system
**/

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Need to pass file path");
    return -1;
  }
  
  char *pathStr = argv[1];

  FILE *f = fopen(pathStr, "r");

  fseek(f, -5, SEEK_END);
 
  long position = ftell(f);

  printf("BYTE POSITION AFTER FSEEK: %ld\n", position);
  
  fclose(f);
}
