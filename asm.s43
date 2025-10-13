#include  "msp430.h"
;-------------------------------------------------------------------------------
            ORG     0F800h                  ; Program Reset
;-------------------------------------------------------------------------------
RESET       mov.w   #0280h,SP               ; Initialize stackpointer
StopWDT     mov.w   #WDTPW+WDTHOLD,&WDTCTL  ; Stop WDT 
Load        mov.b   &CALBC1_1MHZ,&BCSCTL1   ; Set DCO to 1MHz   
            mov.b   &CALDCO_1MHZ,&DCOCTL
SetupP1     bis.b   #001h,&P1DIR            ; P1.0 output
SetupTA     mov.w   #TASSEL_2+MC_2+ID_1,&TACTL   ; SMCLK, contmode

main      

            xor.b   #1,&P1OUT            ; Toggle P1.0
            ;  pass a paramater to delay_us subroutine
            call    #delay_usx2
            jmp     main


delay_usx2

            ret
            

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            ORG     0FFFEh                  ; MSP430 RESET Vector
            DW      RESET                   ;
            END
