NUM_LOOPS = 100                ; Number of loop iterations to run.
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
u8_d:    .space 1
;u8_t:    .space 1 This are unnecisary
;u8_c:    .space 1 This are unnecisary
;u16_t:	 .space 2 this doesnt exist
u16_a:	 .space 2
u16_b:   .space 2
u16_c:   .space 2
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
    ; uint16_t u16_a = 0xE494;
    ; Input
    ;mov W1, u16_t
    ;mov #0xe494, W1 
    mov #0xE494, W1
    mov W1, u16_a
    ; Output
    ; YOUR OUTPUT CODE HERE
    
    ;           W?       W?
    ; uint16_t u16_b = 0x29A5;
    ; Input
    mov #0x29A5, W1
    mov W1, u16_b
    ; Output
    ; YOUR OUTPUT CODE HERE

    ;           W?       W?
    ; uint16_t u16_c = 0xA57D;
    ; Input
    mov #0xA57D, W1
    mov W1, u16_c
    ; Output
    ; YOUR OUTPUT CODE HERE

    ;          W?      W?
    ; uint8_t u8_d = 0x8F;
    mov.b #0x8f, W0
    mov.b WREG, u8_d
    ; YOUR INPUT CODE HERE
    ; Output
    ; YOUR OUTPUT CODE HERE
    
    ; u8_e = 0;
    ;clr.b u8_e
    ;changed the clear into a mov
    mov.b #0x00, W0
    mov.b WREG, u8_e
    ; do {
    do_top:
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
	
	
	;w1 = u16_b
	mov u16_b, W1
	;w2 = u16_c
	mov u16_c, W2
	;w3 = u8_d
	mov.b u8_d,  WREG
	mov.b W0, W3
	;w4 = u8_e
	;!! u8_e isn't initialized here ;??
	mov.b u8_e, wreg
	mov.b w0, w4
	;w0 = u16_a
	mov u16_a, W0
        call _check
	
	;redoing the delcaration because _check fucks em up? 
	;w1 = u16_b
	mov u16_b, W1
	;w2 = u16_c
	mov u16_c, W2
	;w3 = u8_d
	mov.b u8_d,  WREG
	mov.b W0, W3
	;w4 = u8_e
	;!! u8_e isn't initialized here
	mov.b u8_e, wreg
	mov.b w0, w4
	;w0 = u16_a
	mov u16_a, W0

        ; *********************************************************************
        ; TO DO: Implement the code fragment below.
        ; *********************************************************************

        ;      W?       W?
        ;if (u16_c & 0x0040)  {
	mov #0x0040, W5
	and W2, W5, W5
	bra NZ, if_1
	bra Z, else_1
        ; Input
        ; Process
        ; Output
	if_1:
            ; Replace this line with your register assigments.
            ; u8_d = ~u8_d - u8_e;
            com.b W3, W3
	    sub.b W3, W4, W0
	    mov.b WREG, u8_d
            ; Process
            ; Output

            ; Replace this line with your register assigments.
            ; u16_a = u16_b | u16_c;
            IOR W1, W2, W0
	    mov W0, u16_a
            ; Process
            ; Output

            ; Replace this line with your register assigments.
            ; u16_b = u16_b - u16_c;
            sub W1, W2, W1
	    mov W1, u16_b
	    goto end_else_1
            ; Process
            ; Output

	end_if_1:

        ; Code may go here...
        ; } else {
	else_1:
        ; ...and may also go here.

            ; Replace this line with your register assigments.
	    
            ; if (u16_a <= u16_b) {
	    mov u16_a, W0
	    cp u16_b
	    bra GEU, if_2
	    bra LTU, else_2
	    if_2:
            ; Process
            ; Output

                ; Replace this line with your register assigments.
                ; u16_a = (u16_a << 2) + 0xA500 + (uint16_t) u8_d;
		; u16_a << 2
		
		MOV.b u8_d, WREG
		MOV.b W0, W3
		MOV u16_a, W0
		
                SL W0, #2, W0
		;w3 is empty here? 
		;(uint16_t) u8_d
		ZE W3, W3
		; (u16_a <<2) + 0xA500
		mov #0xA500, W5
		ADD W0, W5, W0
		; above + u8_d
		ADD W0, W3, W0 
		MOV W0, u16_a
		
		goto end_else_1
                ; Process
                ; Output
	    end_if_2:
            ; Code may go here...
            ; } else {
	    else_2:
            ; ...and may also go here.

                ; Replace this line with your register assigments.
                ; u16_a = u16_a - u16_b;
                SUB W0, W1, W0
		MOV W0, u16_a
                ; Process
                ; Output
	    end_else_2: 
            ; Code may go here...
            ; }
            ; ...and may also go here.
	end_else_1:
        ; Code may go here...
        ; }
        ; ...and may also go here.

        ; Replace this line with your register assigments.
        ;  u16_c = ~( (u16_c >> 1) - u16_a);
	
	
        LSR W2, W2
	mov u16_a, W5
	SUB W2, W5, W2
	COM W2, W2
	MOV W2, u16_c
        ; Process
        ; Output
        ; The two lines of C code below have already been implemented.
        ; Do not modify them.

        ; u8_e++
        inc.b u8_e
        ; } while (u8_e < NUM_LOOPS);
        ;        WREG       W1
        mov.b u8_e, WREG
        mov.b #NUM_LOOPS, W1
        cp.b W0, W1
        bra LTU, do_top
        bra GEU, do_end
    do_end:

done:
    goto    done

.end       ;End of program code in this file

/** \endcond */
