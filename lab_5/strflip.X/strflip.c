#include <stdio.h>
#include <stdint.h>

char sz_1[] = "Upper/LOWER.";
char sz_2[] = "mIXeD CaSe..";

/* copies psz_1 to psz_2 with psz_2 getting flipped case version of psz_1*/
void  dostr(char* psz_1, char* psz_2) {
  unsigned char c;

  while (*psz_1 != 0) {
    c = *psz_1;
    if (c > 0x2F) {
      /* make sure it is not a special char */
      *psz_2 = c ^ 0x20; /* xor flips bit */
    } else {
      /* leave special chars alone */
      *psz_2 = c;
    }
    psz_1++;
    psz_2++;
  }
}


int main(void) {
  // Bug: MPLAB X v1.80 printf bug means strings vis %s don't print correctly.
  // So, break printf into two statements.
  printf("Before...\n");
  printf("sz_1: '");
  printf(sz_1);
  printf("'\n");
  printf("sz_2: '");
  printf(sz_2);
  printf("'\n");

  dostr(sz_1, sz_2);

  printf("After...\n");
  printf("sz_1: '");
  printf(sz_1);
  printf("'\n");
  printf("sz_2: '");
  printf(sz_2);
  printf("'\n");

  return 0;
}
