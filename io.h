#pragma once
#include <sys/stat.h>
#include "types.h"

#define O_RDONLY 00
#define O_WRONLY 01

void print(const char* str, size_t len);

int open(const char* pathname, int flags, int mode);
void close(int fd);
ssize_t read(int fd, char* buffer, size_t size);
ssize_t write(int fd, const char* buffer, size_t size);

int fstat(int fd, struct stat *buf);
