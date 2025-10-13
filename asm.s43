#include "msp430.h"                     ; #define controlled include file

        ORG     0FFFEh
        DC16    init                    ; set reset vector to 'init' label



        ORG     0200h
        ;RSEG    DATA16_N
myram   DS      50        

        RSEG    CODE                    ; place program in 'CODE' segment
init:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP 
        MOV.W   #mystr,R4
        MOV.W   #myram,R5
        MOV.W   #0000h,R6
        MOV.W   #0000h,R7
        MOV.W   #0000h,R8
        MOV.W   #0000h,R9    
        MOV.W   #0000h,R10
        MOV.W   #0000h,R11

main:                                   ; main program
        inc.w   R6                      ; increment loop counter
        mov.b	@R4, 0(R5)              ; copy data @ "at" the memory location indicated by R4 to the memory location indicated by R5
        inc.w   R4                      ; point to the next source byte
        inc.w   R5                      ; point to the next destination byte

        JMP main                        ; jump to beginning of main program
                                        ; (endless loop)
      
        
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
mystr   DB      "CET 453 is the best class I have ever taken!"
                ;         1         2         3          4
                ;12345678901234567890123456789012345678901234567
        
        END                                  
                                        

