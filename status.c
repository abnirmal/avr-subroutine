#include "mathflags.h"
#include "ledbyte.h"

void main( void )
{
  uint8_t i = 7;
  uint8_t j = 15;

  uint8_t k = addflags(i, j);
  ledbyte(k);

  uint8_t k = subflags(i, j);
  ledbyte(k);

}
