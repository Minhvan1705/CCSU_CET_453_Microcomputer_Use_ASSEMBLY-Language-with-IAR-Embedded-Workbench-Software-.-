#include "msp430.h"                     ; #define controlled include file

        NAME    main                    ; module name

        PUBLIC  main                    ; make the main label vissible
                                        ; outside this module
        ORG     0FFFEh
        DC16    init   

        RSEG    CSTACK                  ; pre-declaration of segment
        RSEG    CODE                    ; place program in 'CODE' segment

init:    MOV     #SFE(CSTACK), SP        ; set up stack

      ; 32 bit variable A
        MOV.W   #0004h, R4              // LSD
        MOV.W   #0002h, R5              // MSD

        ; 32 bit variable B
        MOV.W   #0001h, R6              // LSD
        MOV.W   #0000h, R7              // MSD

        ; 32 bit variable C
        MOV.W   #0004h, R8              // LSD
        MOV.W   #0002h, R9             // MSD


        ; 32 bit variable D
        MOV.W   #0001h, R10             // LSD
        MOV.W   #0000h, R11             // MSD  - LINE 30
        
        MOV.W   #0001h, R12
        ; main program
main:
       ; math routine 1, subtract variable B from variable A
       SUB.W   R6,R4        ; Subtract LSDs  - LINE 35
       SUB.W   R7,R5        ; Subtract MSDs  - LINE 36

       ; math routine 2, subtract variable D from variable C
       SUB.W    R10,R8      ; Subtract LSDs  - LINE 39
       SUBC.W   R11,R9      ; Subtract carry from MSD - LINE 40

       INC.W    R12         ; increment loop counter

        JMP main                         ; jump to main
end:                                   
        END
