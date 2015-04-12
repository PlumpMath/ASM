#include "types.h"

void memset(void* ptr, int c, size_t size) {
  for (size_t i = 0; i < size; i++)
    ((char*)ptr)[i] = c;
}
