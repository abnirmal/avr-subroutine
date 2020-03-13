	;; count.S
	;; Bicky Manandhar
	;; Nirmal Panta
	;; counts from 0 to 255 and displays in led

	#define __SFR_OFFSET 0
	#include <avr/io.h>

.text
	;; define ledbyte as an external function
.extern ledbyte
	
.global main
	
	;; .equ DDRD, 0x0a
	;; .equ PORTD, 0x0b
	;; .equ PORTB, 0x05

main:
	ser r26
	out DDRD, r26                 ; set PORTD as output pin

start_loop:
	clr r20			      ; clear r24

for_loop:
	;; out PORTB, r24		      ; write count register to PortB
	mov r24, r20		; load value of r20 into r24
	call ledbyte                  ; call ledbyte with value in r24
	inc r20                       ; increase counter
	cpi r20, 255                  ; compare r24 value with 255
	brne for_loop                 ; if <>255, repeat

	jmp start_loop

	ret
	
