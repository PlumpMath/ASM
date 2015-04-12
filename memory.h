#pragma once
#include "types.h"

void* malloc(size_t size);
void free(void* ptr);
void memset(void* ptr, int c, size_t size);
