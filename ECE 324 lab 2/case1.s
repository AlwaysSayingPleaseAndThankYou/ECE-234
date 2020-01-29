NUM_LOOPS = 100                 ; Number of loop iterations to run.
                                ; For debug, choose a small number (1 to 10)
                                ; then increase it when your code works.

.bss                            ; Unitialized data section.
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

    ; Register assignment. Fill in the values in the comment on the next line.
    ; Do this for ALL register assignments in this program!
    ;           W?       W?
    ; uint16_t u16_a = 0x34AF;
    ; Input
    ; YOUR INPUT CODE HERE
    ; Output
    ; YOUR OUTPUT CODE HERE
    
    ;         W?       W?
    ; uint16_t u16_b = 0x29FE;
    ; Input
    ; YOUR INPUT CODE HERE
    ; Output
    ; YOUR OUTPUT CODE HERE

    ;         W?       W?
    ; uint16_t u16_c = 0xA458;
    ; Input
    ; YOUR INPUT CODE HERE
    ; Output
    ; YOUR OUTPUT CODE HERE

    ;        W?      W?
    ; uint8_t u8_d = 0x45;    
    ; Input
    ; YOUR INPUT CODE HERE
    ; Output
    ; YOUR OUTPUT CODE HERE
    
    ; WO     WO
    ; u8_e = 0;
    ; Input
    mov.b #0, W0
    ; Output
    mov.b WREG, u8_e

    ; do {
    do_top:
      
        ;        W0     W1     W2     W3    W4
        ; check(u16_a, u16_b, u16_c, u8_d, u8_e);
        ; Input
        mov.b u8_e, WREG
        mov.b W0, W4
        ; *********************************************************************
        ; TO DO: To print out the variables in your code, set:
        ; W0 = u16_a
        ; W1 = u16_b
        ; W2 = u16_c
        ; W3 = u8_d
        ; W4 = u8_e
        ; Note: since only u8_e is used in this sample,
        ; this sample code just sets it. You'll have to do all of them. Make
        ; sure your code comes AFTER this comment but BEFORE the call 
        ; instruction.
        ; *********************************************************************
        ; Your code goes here.
        ; Process
        rcall _check

        ; *********************************************************************
        ; TO DO: Implement the code fragment below:
        ; 1. Fill in all register assignments.
        ; 2. Write the code for each line. DO NOT rely on previous register
        ;    values from other lines of code. Instead, simply load in all inputs
        ;    for the line of C code you're implementing.
        ; *********************************************************************

        ;      W?       W?
        ; if (u16_c & 0x0002) {
        ; Input
        ; Process
        ; Output

            ; Replace this line with your register assigments.
            ; u8_d = ~u8_d + 130 + u8_d;
            ; Input
            ; Process
            ; Output

            ; Replace this line with your register assigments.
            ; u16_a = u16_b - (((uint16_t) u8_d) << 2);
            ; Input
            ; Process
            ; Output
            
            ; Replace this line with your register assigments.
            ; u16_b = u16_a ^ u16_b;   // Note that ^ is an exclusive OR.
            ; Input
            ; Process
            ; Output
            
           
            
        ; Code may go here...
        ; } else {
        ; ...and may also go here.
        
            ; Replace this line with your register assigments.
            ; if (u16_a >= u16_b) {
            ; Input
            ; Process
            ; Output
            
                ; Replace this line with your register assigments.
                ; u16_a = u16_a - u16_b;
                ; Input
                ; Process
                ; Output
                
            ; Code may go here...
            ; } else {
            ; ...and may also go here.

                ; Replace this line with your register assigments.
                ; u16_b = (u16_a << 2) - ((uint16_t) u8_d);
                ; Input
                ; Process
                ; Output

            ; Code may go here...
            ; }
            ; ...and may also go here.

        ; Code may go here...
        ; }
        ; ...and may also go here.
        
        ; Replace this line with your register assigments.
        ; u16_c = ~(u16_c >> 1) + u16_a;
        ; Input
        ; Process
        ; Output

        ; The two lines of C code below have already been implemented.
        ; Do not modify them.

        ; u8_e++
        inc.b u8_e
        
    ;           W0       W1
    ; } while (u8_e < NUM_LOOPS);
    ; Input
    mov.b u8_e, WREG
    mov.b #NUM_LOOPS, W1
    ; Process
    cp.b W0, W1
    ; Output
    bra LTU, do_top
    bra GEU, do_end
    do_end:

done:
    goto    done

.end       ;End of program code in this file

/** \endcond */
