; Number of loop iterations to run. For debug, choose a small number (1 to 10)
; then increase it when your code works.
NUM_LOOPS = 100


; Unitialized data section.
.bss
; *****************************************************************************
; TO DO: Declare other variables above; only u8_e is declared here. See the
; next TO DO comment for what variables to declare.
;
; You MUST place .space declarations for 32-bit variables first, followed by
; 16-bit variables, followed by 8-bit variables, to preserve proper alignment.
; For example,
; u32_b: .space 4
; u16_c: .space 2
; u8_a:  .space 1
; is the correct order.
; *****************************************************************************
u8_e:    .space 1

;..............................................................................
;Code Section in Program Memory
;..............................................................................

.text                           ; Start of Code section.

.global _main                   ; Therefore, it must be visible outside this file.
_main:                          ; _main is called after C startup code runs.

    ; *************************************************************************
    ; TO DO: Translate the assignments below to PIC24 assembly. Declare these
    ; variables after the previous TO DO comment.
    ; *************************************************************************
    ;; int32_t i32_a = 0xB3E83894;
    ;; int32_t i32_b = 0x348AC297;
    ;; int32_t i32_c = 0x93CDA55A;
    ;; int16_t i16_d = 0x45;

    ; u8_e = 0;
    clr.b u8_e

    ; do {
    do_top:

        mov.b u8_e, WREG
        mov.b W0, W7
        ; *********************************************************************
        ; TO DO: To print out the variables in your code, set:
        ; W1:W0 = i32_a
        ; W3:W2 = i32_b
        ; W5:W4 = i32_c
        ; W6 = i16_d
        ; W7 = u8_e
        ; Note: since only u8_e is used in this sample,
        ; this sample code just sets it. You'll have to do all of them. Make
        ; sure your code comes AFTER this comment but BEFORE the call
        ; instruction.
        ; *********************************************************************
        ; Your code goes here.
        call _check

        ; *********************************************************************
        ; The code fragment to implement:
        ; *********************************************************************
        ; if (i32_c & 0x0002) {
        ;      i16_d = ~i16_d + 0x823056ab + i16_d;
        ;      i32_a = i32_b - (((int32_t) i16_d) << 2);
        ;      i32_b = i32_a ^ i32_b;  //exclusive OR
        ; } else {
        ;    if (i32_a >= i32_b) {
        ;      i32_a = (i32_a - i32_b) << 1 ;
        ;    } else {
        ;      i32_b = (i32_a << 2) - ((int32_t) i16_d);
        ;    }
        ; }
        ; i32_c = ~(i32_c >> 1) + i32_a;


        ; *********************************************************************
        ; TO DO: Complete the templates below:
        ; 1. Fill in all register assignments.
        ; 2. Write the code for each line. DO NOT rely on previous register
        ;    values from other lines of code. Instead, simply load in all inputs
        ;    for the line of C code you're implementing.
        ; *********************************************************************
        ;      W?       W?
        ; if (i32_c & 0x0002) {
        ; Input
        ; Process
        ; Output

            ; Replace this line with your register assigments.
            ; i16_d = ~i16_d + 0x56ab + i16_d;
            ; Input
            ; Process
            ; Output

            ; Replace this line with your register assigments.
            ; i32_a = i32_b - (((int32_t) i16_d) << 2);
            ; Input
            ; Process
            ; Output

            ; Replace this line with your register assigments.
            ; i32_b = i32_a ^ i32_b;  //exclusive OR
            ; Input
            ; Process
            ; Output


        ; Code may go here...
        ; } else {
        ; ...and may also go here.

            ; Replace this line with your register assigments.
            ; if (i32_a >= i32_b) {
            ; Input
            ; Process
            ; Output

                ; Replace this line with your register assigments.
                ; i32_a = (i32_a - i32_b) << 1 ;
                ; Input
                ; Process
                ; Output

            ; Code may go here...
            ; } else {
            ; ...and may also go here.

                ; Replace this line with your register assigments.
                ; i32_b = (i32_a << 2) - ((int32_t) i16_d);
                ; Input
                ; Process
                ; Output

            ; Code may go here...
            ; }
            ; ...and may also go here.

        ; Code may go here...
        ; }
        ; ...and may also go here.


        ; Output
        ; Replace this line with your register assigments.
        ; i32_c = ~(i32_c >> 1) + i32_a;
        ; Input
        ; Process
        ; Output



        ; The two lines of C code below have already been implemented.
        ; Do not modify them.

        ; u8_e++
        inc.b u8_e
        ;        WREG       W1
        ; } while (u8_e < NUM_LOOPS);
        mov.b u8_e, WREG
        mov.b #NUM_LOOPS, W1
        cp.b W0, W1
        bra LTU, do_top
        bra GEU, do_end
    do_end:

done:
    goto    done

