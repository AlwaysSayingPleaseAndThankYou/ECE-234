NUM_LOOPS = 100                 ; Number of loop iterations to run.
                                ; For debug, choose a small number (1 to 10)
                                ; then increase it when your code works.

         .bss                    ;unitialized data section
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
u16_a:  .space 2
u16_b:  .space 2
u8_c:   .space 1
u8_e:   .space 1

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
/*
    uint16_t u16_a = 0x49BA;
    uint16_t u16_b = 0xF202;
    uint8_t u8_c = 0x3C;
*/

    ;          W0      W0
    ; uint16_t u16_a = 0x49BA;
    mov #0x49BA,W0
    mov W0, u16_a
    
    ;         W0        W0
    ; uint16_t u16_b = 0xF202;
    mov #0xF202,W0
    mov W0, u16_b
    
    ; uint8_t u8_c = 0x3C;
    mov.b #0x3C, W0
    mov.b WREG, u8_c
    
    ; u8_e = 0;
    clr.b u8_e

    ; do {
    do_top:
  
        ; *********************************************************************
        ; TO DO: To print out the variables in your code, set:
        ; W0 = u16_a
        ; W1 = u16_b
        ; W2 = u8_c
        ; W3 = u8_e
        ; Note: since only u8_e is used in this sample,
        ; this sample code just sets it. You'll have to do all of them. Make
        ; sure your code comes AFTER this comment but BEFORE the call 
        ; instruction.
        ; *********************************************************************
        ; Your code goes here.
        mov.b u8_e, WREG
        mov.b W0, W3        ;W3 = u8_e
        mov.b u8_c, WREG
        mov   W0, W2           ;W2=u8_c
        mov   u16_b, W1        ;W1 = u16_b
        mov   u16_a, W0        ;W0 = u16_a
        call  _check

        ; *********************************************************************
        ; TO DO: Implement the code fragment below.
        ; *********************************************************************
/*
        if (u16_b & 0x0100) { //this is a bittest of the LSb of the most significant Byte
            u16_a = u16_b + u8_c;
            u16_b = u16_a - u16_b;
        } else {
            u16_b = u16_a - u16_b;
            u16_a = ~u16_b;
        }
        u8_c = u8_c + 0x5;
        u8_e++;
*/

        ;      W0        W1
        ; if (u16_b & 0x0100) { //this is a bittest of the LSb of the most significant Byte
        ; Input
        mov u16_b, W0
        mov #0x0100, W1
        ; Process
        and W0, W1, W2      ; Don't care about dest of W2, since only flags matter
        ; Output
        bra NZ, if_1        ; NZ = true: go to if body. *** This line is optional. ***
        bra Z, else_1       ; Z = false: go to else body

            if_1:        
            ;  W1      W2      W0
            ; u16_a = u16_b + u8_c;   // Note: MUST reserve W0 aka WREG for 8-bit variables
            ; Input
            mov   u16_b, W2
            mov.b u8_c, WREG    ; WREG is only used in this style for mov.b operations.
            ; Process
            ze    W0, W0        ; u8_c must be converted to 16 bits before addition
            add   W2, W0, W1
            ; Output
            mov   W1, u16_a

            ;  W0      W1      W0
            ; u16_b = u16_a - u16_b;
            ; Input
            mov   u16_a, W1
            mov   u16_b, W0
            ; Process
            sub   W1, W0, W0
            ; Output
            mov   W0, u16_b
           
            bra   end_if_1
        ; } else {
            else_1:
          
            ;  W0      W1      W0
            ; u16_b = u16_a - u16_b;
            ; Input
            mov   u16_a, W1
            mov   u16_b, W0
            ; Process
            sub   W1, W0, W0
            ; Output
            mov   W0, u16_b
           
            ;  W0       W1
            ; u16_a = ~u16_b;
            ; Input
            mov   u16_b, W1
            ; Process
            com   W1, W0      ; Recall that ~ in C is a bitwise complement
            ; Output
            mov   W0, u16_a
          
        ; }
        end_if_1:

        ; W0      W0     W1
        ; u8_c = u8_c + 0x5;
        ; Input
        mov.b u8_c, WREG
        mov.b #0x5, W1
        ; Process
        add.b W0, W1, W0
        ; Output
        mov.b WREG, u8_c


        ; The two lines of C code below have already been implemented.
        ; Do not modify them.
        ; u8_e++
        inc.b u8_e
        ; } while (u8_e < NUM_LOOPS);
        ;           W0       W1
        mov.b u8_e, WREG
        mov.b #NUM_LOOPS, W1
        cp.b  W0, W1
        bra   LTU, do_top
        bra   GEU, do_end    ; *** This line is optional. ***
    do_end:

done:
    goto    done

.end       ;End of program code in this file

/** \endcond */
