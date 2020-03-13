#include <avr/io.h>
#include "ledbyte.h"

void ledbyte(uint8_t b)
{
    unsigned char mask = b;
    unsigned char data = b;
    volatile unsigned int i;
    DDRD = mask;
    PORTD = data;
    for (i = 0; i < 65535U; i++)
    {

    }
}

