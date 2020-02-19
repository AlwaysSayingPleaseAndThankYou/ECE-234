#include <stdio.h>
#include <stdint.h>

char sz_1[] = "Upper/LOWER.";
char sz_2[] = "mIXeD CaSe..";


/* exchanges psz_1, psz_2 with psz_1 getting the flipped case version of psz_2 */
void dostr (char *psz_1,char *psz_2) {
  unsigned char c, tmp;

  while (*psz_1 != 0) {
    tmp = *psz_1;
    c = *psz_2;
    if (c > 0x2F) {
      /* make sure it is not a special char */
      *psz_1 = c ^ 0x20; /* flip case of s2 */
    } else {
      /* leave special chars alone */
      *psz_1 = c;
    }
    *psz_2 = tmp;
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
