	;; mathflags.S
	;; Bicky Manandhar
	;; Nirmal Panta
	;; peforms arithmetic and returns SREG

	#define __SFR_OFFSET 0
	#include <avr/io.h>

.text
	
	;; define ledbyte as an external function
.extern ledbyte
	
.global addflags subflags

addflags:
	add r24, r22		; add r22 and r24 and put in r24
	out sreg, r24		; output value of sreg in r24
	ret

subflags:
	sub r24, r22		; subtract r22 from r24
	out sreg, r24		; output value of sreg in r24
	ret
