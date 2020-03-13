	;; walk.S
	;; Bicky Manandhar
	;; Nirmal Panta
	;; shows a walking LED animation

	.equ DDRD, 0x0a
	.equ PORTD, 0x0b
	.equ PINC, 0x06
	.equ DDRC, 0x07

.text
main:
	cbi DDRC, 0
	out DDRD, 0xff ; set PD0 as output pin

loop:
	in r25, PINC		; read Port C and put value into r25
	cpi r25, 0		
	brne desc

asc:	
	sbi PORTD, 0
	call delay
	cbi PORTD, 0
	call delay
	sbi PORTD, 1
	call delay
	cbi PORTD, 1
	call delay
	sbi PORTD, 2
	call delay
	cbi PORTD, 2
	call delay
	sbi PORTD, 3
	call delay
	cbi PORTD, 3
	call delay
	sbi PORTD, 4
    call delay
    cbi PORTD, 4
    call delay
	sbi PORTD, 5
    call delay
    cbi PORTD, 5
    call delay
	sbi PORTD, 6
    call delay
    cbi PORTD, 6
    call delay
    sbi PORTD, 7 ; set PD0 (turn on)
    call delay
    cbi PORTD, 7 ; clear PD0 (turn off)
    call delay

	jmp loop

desc:
	sbi PORTD, 7
	call delay
	cbi PORTD, 7
	call delay
	sbi PORTD, 6
	call delay
	cbi PORTD, 6
	call delay
	sbi PORTD, 5
    call delay
    cbi PORTD, 5
    call delay
	sbi PORTD, 4
    call delay
    cbi PORTD, 4
    call delay
	sbi PORTD, 3
    call delay
    cbi PORTD, 3
    call delay
	sbi PORTD, 2
    call delay
    cbi PORTD, 2
    call delay
	sbi PORTD, 1
    call delay
    cbi PORTD, 1
    call delay
    sbi PORTD, 0 ; set PD0 (turn on)
    call delay
    cbi PORTD, 0 ; clear PD0 (turn off)
    call delay

	jmp loop	

;; loop 65535 time to create a delay 
delay:
    ldi r31, 0xff
    ldi r30, 0xff   ; r31 + r30 is 16 bits = 65535 

delay1: 
    nop
    nop
    nop
    nop
    nop
    nop  
    nop
    nop
    nop
    nop
    nop

    sbiw r30, 1 ; subtract 1 from r31-r30 
    brne delay1 ; branch if result is not equal to zero

	ret
	
