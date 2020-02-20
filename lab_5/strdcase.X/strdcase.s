; *******************
; upcase_asmversion.s
; *******************
;
; illustrates string initialization from program memory
; using the PSV window

.include "xc.inc"

; Declare variables
; =================
; Unitialized data section
.bss
sz_1:   .space 16
sz_2:   .space 16
u8_c:   .space 1
mplab_x_bug: .space 2

; Initialized constant data section.
; The statement below is taken from DS70613C, page 4-21..section .const, psv
sz_1_const: .asciz "Upper/lower."
sz_2_const: .asciz "mIXeD CaSe.."
 
 dostr: 
    
    mov [W0], W3
    cp.b W3
    ;While start
    bra Z, dostr_While_end
    ;store value incase need unchagned
    mov.b [W1], u8_c
    ;if start
    mov [W0], W3
    mov #0x2F, W2
    cp.b W3, W2
    bra GTU, dostr_think_more
    bra LEU, dostr_done
    
    ;if(u8_c > 0x2f) == true
    dostr_think_more:
    mov [W0], W3
    mov #0x20, W2
    ior W3, W2, [W1]
    
    ;else
    dostr_done: 
    mov.b u8_c, [W1]
    ;incriment W0
    inc W0, W0
    inc W1, W1
    bra dostr
    dostr_While_end:
    return
    
    
 main: 
    mov.b sz_2, W0
    ;TODo FIX W0 moves.b
    mov.b sz_1, W1
    rcall dostr

