#pragma once
#include "types.h"

void* malloc(size_t size);
void free(void* ptr);
void memset(void* ptr, int c, size_t size);

#if 0
static void* g_pos = heap();
static size_t g_size = 0;

void* malloc(size_t size) {
  void* pos = g_pos;
  int ec = heap_resize(g_size + size);
  if (ec < 0)
    return 0;
  g_size += size;
  g_pos += size;
  return pos;
}

void free(void* ptr) {
}
#endif
