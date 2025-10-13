#include "msp430.h"                     ; #define controlled include file

        ORG     0FFFEh
        DC16    init                    ; set reset vector to 'init' label

        RSEG    CODE                    ; place program in 'CODE' segment
init:   NOP
        MOV.W   #1234h,R4               ; Initialize source data to identifiable value 0x1234
        MOV.W   #0200h,R5               ; Initialize destination address to start of RAM
        MOV.W   #0000h,R6               ; Initialize loop counter to zero

main:                                   ; main program
        MOV.W	R4, 0(R5)               ; copy source data in R4 to the memory location indicated by R5
        INC.W   R4                      ; increment source data to next value
        ;INC.W   R5                      ; point to the next destination address (odd byte)
        ADD.W   #0002h, R5              ; point to the next destination address (even byte)
        INC.W   R6                      ; increment loop counter

        JMP main                        ; jump to beginning of main program
                                        ; (endless loop)
      
        
        END                                  
                                        

