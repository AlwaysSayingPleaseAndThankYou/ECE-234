#include <stdio.h>

void upcase (char *psz_1) {
  while (*psz_1 != 0) {
    //convert to upper case
    if (*psz_1 > 0x60 && *psz_1 < 0x7B)  {
      //lowercase a-z, so
      //convert to A-Z
      *psz_1 = *psz_1 - 0x20;
    }
    psz_1++;  //advance to next char
  }
}

char sz_1[] = "Hello";
char sz_2[] = "UPPER/lower";

int main(void) {
  upcase(sz_1);
  upcase(sz_2);
  while (1);
}
