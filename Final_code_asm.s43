#include "msp430g2553.h"
;------------------------------------------------------------------------------
        NAME    main                    ; module name

        PUBLIC  main                    ; make the main label vissible
                                        ; outside this module
        ORG     0F800h

init:   MOV.W   #0280h, SP              ; set up stack
        MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Stop watchdog timer
        BIS.B   #DIVS_3,&BCSCTL2        ; SMCLK/8
        MOV.W   #0001h, R15
        MOV.W   #0000h, R5  
Output:
        BIS.B   #0xFF, &P1DIR          ; Set all P1 pins to output (P1.0 to P1.7)
        BIS.B   #0xFF, &P2DIR          ; Set all P2 pins to output (P2.0 to P2.7)
            
        BIS.W   #GIE,SR                         ; enable interrupts
main:   NOP                                     ; main program
        
;-----------------------------------------------------------------------
; Load the stable temperature into R4
;-----------------------------------------------------------------------

    ADD.W # 0x0001, R5   
    CMP R5, R15  
    JEQ TurnOnLED                    ; If R15 = R5, jump to TurnOnLED

    MOV.W # 0x0002, R15
    CMP R5, R15  
    JGE TurnOffLED                    ; If R15 >= R5, jump to TurnOffLED
                 
    JLO BlinkLED 
                                     ; Compare R15  with R5  

TurnOnLED:

    BIS.B #BIT0, &P1OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT1, &P1OUT             ;  P1.1 high and turn on LED
    BIS.B #BIT2, &P1OUT             ;  P1.2 high and turn on LED
    BIS.B #BIT3, &P1OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT4, &P1OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT5, &P1OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT0, &P2OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT1, &P2OUT             ;  P2.0 high and turn on LED
    BIS.B #BIT2, &P2OUT             ;  P2.0 high and turn on LED

    BIS.B #BIT6, &P2OUT             ;  P1.1 high and turn on LED
    BIS.B #BIT7, &P2OUT             ;  P1.2 high and turn on LED
    BIS.B #BIT7, &P1OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT6, &P1OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT5, &P2OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT4, &P2OUT             ;  P1.0 high and turn on LED
    BIS.B #BIT3, &P2OUT             ;  P1.0 high and turn on LED
    
    JMP main                   ; Loop back to check temperature again

TurnOffLED:

    BIC.B #BIT0, &P1OUT             ;  P1.0 high and turn Off LED
    BIC.B #BIT1, &P1OUT             ;  P1.1 high and turn Off LED
    BIC.B #BIT2, &P1OUT             ;  P1.2 high and turn Off LED
    BIC.B #BIT3, &P1OUT             ;  P1.0 high and turn Off LED
    BIC.B #BIT4, &P1OUT             ;  P1.0 high and turn Off LED
    BIC.B #BIT5, &P1OUT             ;  P1.0 high and turn Off LED
    BIC.B #BIT0, &P2OUT             ;  P1.0 high and turn Off LED
    BIC.B #BIT1, &P2OUT             ;  P1.0 high and turn Off LED
    BIC.B #BIT2, &P2OUT             ;  P2.0 Low and turn Off LED

    BIC.B # BIT6, &P2OUT             ;  P1.1 Low and turn Off LED
    BIC.B # BIT7, &P2OUT             ;  P1.2 Low and turn Off LED
    BIC.B # BIT7, &P1OUT             ;  P1.0 Low and turn Off LED
    BIC.B # BIT6, &P1OUT             ;  P1.0 Low and turn Off LED
    BIC.B # BIT5, &P2OUT             ;  P1.0 Low and turn Off LED
    BIC.B # BIT4, &P2OUT             ;  P1.0 Low and turn Off LED
    BIC.B # BIT3, &P2OUT             ;  P1.0 Low and turn Off LED

    JMP main                  ; Loop back to check temperature again

BlinkLED:

    XOR.B #001h, &P1OUT             ;  P1.0 Turn Blink LED
    XOR.B #002h, &P1OUT             ;  P1.1 Turn Blink LED
    XOR.B #004h, &P1OUT             ;  P1.2 Turn Blink LED
    XOR.B #008h, &P1OUT             ;  P1.0 Turn Blink LED
    XOR.B #010h, &P1OUT             ;  P1.0 Turn Blink LED
    XOR.B #020h, &P1OUT             ;  P1.0 Turn Blink LED
    XOR.B #001h, &P2OUT             ;  P1.0 Turn Blink LED
    XOR.B #002h, &P2OUT             ;  P1.0 Turn Blink LED
    XOR.B #004h, &P2OUT             ; P2.0 Turn Blink LED

    XOR.B # BIT2, &P2OUT             ;  P1.1 Turn Blink LED
    XOR.B # BIT6, &P2OUT             ;  P1.2 Turn Blink LED
    XOR.B # BIT7, &P2OUT             ;  P1.0 Turn Blink LED
    XOR.B # BIT6, &P1OUT             ;  P1.0 Turn Blink LED
    XOR.B # BIT5, &P2OUT             ;  P1.0 Turn Blink LED
    XOR.B # BIT4, &P2OUT             ;  P1.0 Turn Blink LED
    XOR.B # BIT3, &P2OUT             ;  P1.0 Turn Blink LED

    MOV.W # 0x0000, R5
    JMP continue
 delay:
    MOV.W #0000h, R15
    
 delay_10000:
    CMP 10000, R15
    JLO delay_10000
    RET
    

;------------------------------------------------------------------------------
continue:
        BIT.W   #0002h,R5  ; if the conversion has already been started do nothing
        JEQ      main
        bis.w   #ENC+ADC10SC,&ADC10CTL0     ; Start sampling/conversion
        BIS.W   #0001h,R5                   ; set bit to indicate a conversion has been started

        JMP main                           ; jump to main

ADC10_ISR:
        MOV.W   &ADC10MEM,R15              ; Store value
        BIS.W   #0FC00h,R15
        BIC.W   #0001h,R5                  ; Allow a new conversion to take place

        reti
        
;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
        ORG     0FFFEh
        DC16    init                    ; set reset vector to 'init' label
        ORG     0FFEAh                  ; ADC10 interrupt vector 
        DW      ADC10_ISR

        END

