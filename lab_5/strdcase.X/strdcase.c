#include <stdio.h>
#include <stdint.h>

char sz_1[] = "Upper/LOWER.";
char sz_2[] = "mIXeD CaSe..";


/* copies psz_2 to psz_1, downcases all letters */
void dostr (char* psz_1,char* psz_2) {
  uint8_t u8_c;

  while (*psz_2 != 0) {
    u8_c = *psz_2;
    if (u8_c > 0x2F) {
      /* make sure it is not a special char */
      *psz_1 = u8_c | 0x20; /* sets this bit */
    } else {
      /* leave special chars alone */
      *psz_1 = u8_c;
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
