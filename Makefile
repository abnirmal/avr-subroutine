# Nirmal Panta and Bicky Manandhar
ledbyte.o: ledbyte.c ledbyte.h
	avr-gcc -mmcu=atmega328p -c ledbyte.c -o ledbyte.o

count.o: count.S
	avr-gcc -mmcu=atmega328p -c count.S -o count.o

count.elf: count.o ledbyte.o
	avr-gcc -mmcu=atmega328p count.o ledbyte.o -o count.elf

count.hex: count.elf
	avr-objcopy -j .text -j .data -O ihex count.elf count.hex

install-count: count.hex
	avrdude -p atmega328p -c usbtiny -U flash:w:count.hex:i

status.o: status.c ledbyte.h
	avr-gcc -mmcu=atmega328p -c status.c ledbyte.h -o status.o

mathflags.o: mathflags.h mathflags.S
	avr-gcc -mmcu=atmega328p -c mathflags.h mathflags.S -o mathflags.o

status.elf: status.o mathflags.o
	avr-gcc -mmcu=atmega328p status.o ledbyte.o -o status.elf

status.hex: status.elf
	avr-objcopy -j .text -j .data -O ihex status.elf status.hex

install-status: status.hex
	avrdude -p atmega328p -c usbtiny -U flash:w:status.hex:i

reset:
	avrdude -p atmega328p -c usbtiny -U flash:w::i

clean:
	rm -f *.o *.elf *.hex *.lst
