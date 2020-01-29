#include <stdio.h>
#include <stdint.h>

void check(uint16_t u16_a1, uint16_t u16_b1, uint8_t u8_c1, uint8_t u8_e1) {
  static uint16_t u16_a = 0x49BA;
  static uint16_t u16_b = 0xF202;
  static uint8_t u8_c = 0x3C;
  static uint8_t  u8_e = 0;
  static int16_t i16_lastFailure = -1;

  // Indicate start of test
  if (u8_e == 0)
    printf("\n\n\nTest started.\n");

// Print out expected vs. acutal values
  printf(" a:%04x,  b:%04x,  c:%02x,  e:%02x is correct; saw\n",
         u16_a,     u16_b,    u8_c,   u8_e);
  printf("a1:%04x, b1:%04x,  c1:%02x, e1:%02x ",
         u16_a1,    u16_b1,  u8_c1,  u8_e1);

  // Print out a pass/fail indication
  if ((u16_a == u16_a1) && (u16_b == u16_b1) &&
      (u8_c == u8_c1) &&
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

  // This is the code to be executed
  if (u16_b & 0x0100) { //this is a bittest of the LSb of the most significant Byte
    u16_a = u16_b + u8_c;
    u16_b = u16_a - u16_b;
  } else {
    u16_b = u16_a - u16_b;
    u16_a = ~u16_b;
  }
  u8_c = u8_c + 0x5;
  u8_e++;
}



