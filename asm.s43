#include "msp430.h"                     ; #define controlled include file

        NAME    main                    ; module name

        PUBLIC  main                    ; make the main label vissible
                                        ; outside this module
        ORG     0FFFEh
        DC16    init                    ; set reset vector to 'init' label

        RSEG    CSTACK                  ; pre-declaration of segment
        RSEG    CODE                    ; place program in 'CODE' segment

init:   MOV     #SFE(CSTACK), SP        ; set up stack
        MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer

        ; 32 bit variable A
        MOV.W   #0FFFCh, R4             
        MOV.W   #01000h, R5         

        ; 32 bit variable B
        MOV.W   #0FFFCh, R6
        MOV.W   #01000h, R7

        ; 32 bit variable C
        MOV.W   #0001h, R8
        MOV.W   #0000h, R9

        ; 32 bit variable D
        MOV.W   #0001h, R10
        MOV.W   #0000h, R11
        MOV.W   #0001h, R12     ; loop counter
        ; main program
main:
        ; math routine 1, add variable C to variable A
        ADD.W   R8,R4 	        ; ADD LSDs with no carry in
        ADD.W   R9,R5 	        ; ADD MSDs with no carry in            
        
        ; math routine 2, add variable D to variable B
        ADD.W   R10,R6   	; ADD LSDs with no carry in
        ADDC.W  R11,R7     	; ADD MSDs with carry in            
         
        INC.W  R12         
                
        JMP main                           ; jump to current location main
                
        END
