#include  "msp430g2553.h"

;                MSP430G2xx3
;             -----------------
;         /|\|              XIN|-
;          | |                 | 
;          --|RST          XOUT|-
;            |                 |
;            |       P1.4/SMCLK|-->SMCLK 
;            |             P1.1|-->MCLK/10
;            |        P1.0/ACLK|-->ACLK

#define SELS_0                (0x00)   /* SMCLK Source Select 0:DCOCLK */
#define SELS_1                (0x08)   /* SMCLK Source Select 1:XT2CLK/LFXTCLK */

;-------------------------------------------------------------------------------
            ORG     0F800h                  ; Program Reset
;-------------------------------------------------------------------------------
RESET       mov.w   #0280h,SP               ; Initialize stackpointer
StopWDT     mov.w   #WDTPW+WDTHOLD,&WDTCTL  ; Stop WDT

SetupDCO    mov.b   &CALBC1_1MHZ,&BCSCTL1   ; Set DCO to 1MHz
            mov.b   &CALDCO_1MHZ,&DCOCTL

SetupVLO    bis.b   #LFXT1S_2,&BCSCTL3      ; LFXT1 = VLO = 12KHz

            bic.b   #OFIFG,&IFG1            ; Clear OSC fault flag
SetupP1     bis.b   #BIT0 + BIT1 + BIT4,&P1DIR  ; P1.0, P1.1, P1.4 outputs
            bis.b   #BIT0 + BIT4, &P1SEL        ; P1.0 = ACLK, P1.4 = SMCLK
            
SetupMCLK   bis.b   #SELM_1, &BCSCTL2           ; [SELM] CLOCK SOURCE FOR MCLK = DCO
            bis.b   #DIVM_0, &BCSCTL2          ; [DIVM] DIVIDER FOR MCLK = 1 (100%) 
            
SetupSMCLK  bis.b   #SELS_0, &BCSCTL2           ; [SELS] CLOCK SOURCE FOR SMCLK = DCO
            bis.b   #DIVS_0, &BCSCTL2          ; [DIVS] DIVIDER FOR SMCLK = 1 (100%) 
            
SetupACLK   bis.b   #DIVA_0, &BCSCTL1          ; [DIVA] DIVIDER FOR ACLCK = 1 (100%) 

main
            bis.b   #BIT1,&P1OUT            ; P1.1 = 1
            bic.b   #BIT1,&P1OUT            ; P1.1 = 0            
            jmp     main
;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            ORG     0FFFEh                  ; MSP430 RESET Vector
            DW      RESET                   ;
            END
