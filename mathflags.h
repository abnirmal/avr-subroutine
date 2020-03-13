#include <avr/io.h>

uint8_t addflags( uint8_t i, uint8_t j ); // Do i+j and return SREG
uint8_t subflags( uint8_t i, uint8_t j ); // Do i-j and return SREG
