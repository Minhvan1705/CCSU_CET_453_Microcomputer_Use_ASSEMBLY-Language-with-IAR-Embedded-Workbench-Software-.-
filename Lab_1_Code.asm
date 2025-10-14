#include "msp430.h"                     ; #define controlled include file


            ORG     0xFFFE
            DW      0xF800
        
            ORG     0xF800           ; STEP 0 RESET
main:       mov.w   #0x0000, R4      ; STEP 1 Initialize loop counter to zero
            mov.w   #0xFFFF, R5      ; STEP 2 Initialize variable 1
            mov.w   #0x0000, R6      ; STEP 3 Initialize variable 2
            mov.w   #0x0280, SP      ; STEP 4 Initialize Stack Pointer
loop:       inc.w   R4               ;      5  Increment loop counter
            inc.w   R5			;6
            add.w   #0x0001, R5		;7
            add.w   R5,R6		;8
            sub.w   R5,R6		;9
            sub.w   R5,R6		;10
            push.w  #0x0000		;11
            pop.w   R8			;12
call        #myFunction			;13
            NOP				;17
            NOP				;18
            NOP				;19
            JMP     loop		;20
            
myFunction: mov.w  #0x0000,  R7		;14
            inc.w  R7			;15
            ret 			;16
            
            
            

            END     main
