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
 
; Code
; ====
.text
.global __reset
__reset:
; Initialize the stack pointer and stack limit register.
mov #__SP_init, W15
; __SPLIM_init is set by linker to be after allocated data.
mov #__SPLIM_init, W0
mov W0, SPLIM

; Copy constant data to RAM.
;; char sz_1[] = "Hello";
;; char sz_1[] = "UPPER/lower";
call init_variables       ;initialize strings
; Now that everything is initialized, call main().
rcall main
; If main() exits, restart the processor.
reset
 
main: 
  mov.b #sz_1, W0
  mov.b W0, W1
  mov.b #sz_2, W0
  rcall dostr
  done: 
  goto done
   
    
 dostr: 
    
    mov [W0], W3
    cp0.b W3
    ;While start
    bra Z, dostr_While_end
    ;store value incase need unchagned
    mov.b [W0], u8_c
    ;if start
    mov [W0], W3
    mov #0x2F, W2
    cp.b W3, W2
    bra GTU, dostr_think_more
    bra LEU, dostr_else_done
    
    ;if(u8_c > 0x2f) == true
    dostr_think_more:
    mov [W0], W3
    mov #0x20, W2
    ior W3, W2, [W1]
    bra dostr_done
    
    ;else
    dostr_else_done: 
    mov.b u8_c, [W1]
    ;incriment W0
    dostr_done:
    inc W0, W0
    inc W1, W1
    bra dostr
    dostr_While_end:
    return
    
    

