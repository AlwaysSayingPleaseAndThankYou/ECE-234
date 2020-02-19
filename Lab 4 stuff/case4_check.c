#include <stdio.h>
#include <stdint.h>

/// Call this once at the end of each loop.
void check(int32_t i32_a1, int32_t i32_b1, int32_t i32_c1, int16_t i16_d1, uint8_t u8_e1) {
  static int32_t i32_a = 0xB3E83894;
  static int32_t i32_b = 0x348AC297;
  static int32_t i32_c = 0x93CDA55A;
  static int16_t i16_d = 0x45;
  static uint8_t  u8_e = 0;
  static int16_t i16_lastFailure = -1;

  // Indicate start of test
  if (u8_e == 0)
    printf("\n\n\nTest started.\n");

  // Print out expected vs. acutal values
  printf(" a:%08lx,  b:%08lx,  c: %08lx,  d:%04x,  e:%02x is correct; saw\n",
         i32_a,     i32_b,    i32_c,     i16_d,   u8_e);
  printf("a1:%08lx, b1:%08lx, c1: %08lx, d1:%04x, e1:%02x ",
         i32_a1,    i32_b1,  i32_c1,     i16_d1,  u8_e1);
  // Print out a pass/fail indication
  if ((i32_a == i32_a1) && (i32_b == i32_b1) &&
      (i32_c == i32_c1) && (i16_d == i16_d1) &&
      (u8_e == u8_e1)) {
    printf("PASS");
    if (i16_lastFailure >= 0)
      printf("; last failure was at loop %02x.\n", i16_lastFailure);
    else
      printf("\n");
  } else {
    printf("FAIL\n");
    i16_lastFailure = u8_e;
  }
  if (i32_c & 0x0002) {
      i16_d = ~i16_d + 0x56ab + i16_d;
      i32_a = i32_b - (((int32_t) i16_d) << 2);
      i32_b = i32_a ^ i32_b;  //exclusive OR
  } else {
    if (i32_a >= i32_b) {
      i32_a = (i32_a - i32_b) << 1 ;
    } else {
      i32_b = (i32_a << 2) - ((int32_t) i16_d);
    }
  }
  // Execute body of loop
  
  i32_c = ~(i32_c >> 1) + i32_a;
  u8_e++;

}
