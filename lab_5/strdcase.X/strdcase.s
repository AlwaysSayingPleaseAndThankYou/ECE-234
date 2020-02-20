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
mplab_x_bug: .space 2

; Initialized constant data section.
; The statement below is taken from DS70613C, page 4-21.
.section .const, psv
sz_1_const: .asciz "Upper/lower."
sz_2_const: .asciz "mIXeD CaSe.."

