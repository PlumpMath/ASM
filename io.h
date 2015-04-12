#pragma once
#include <sys/stat.h>
#include "types.h"

#define O_RDONLY 00
#define O_WRONLY 01

void print(const char* str, size_t len);

int open(const char* pathname, int flags, int mode);
//#define sys_open(_ret_, _file_, _flags_, _mode_) \
//  asm("int $0x80" : "=a"(_ret_) : "a"(5), "b"(_file_), "c"(_flags_), "d"(_mode_));

void close(int fd);
//#define sys_close(_fd_) \
//  asm("int $0x80" : : "a"(6), "b"(_fd_));

ssize_t read(int fd, char* buffer, size_t size);
//#define read(_ret_, _fd_, _data_, _size_) \
//  asm("int $0x80" : "=a"(_ret_) : "a"(3), "b"(_fd_), "c"(_data_), "d"((int)_size_));

ssize_t write(int fd, const char* buffer, size_t size);
//#define write(_ret_, _fd_, _data_, _size_) \
//  asm("int $0x80" : "=a"(_ret_) : "a"(4), "b"(_fd_), "c"(_data_), "d"((int)_size_));

int fstat(int fd, struct stat *buf);
//#define sys_fstat(_ret_, _fd_, _buf_) \
//  asm("int $0x80" : "=a"(_ret_) : "a"(108), "b"(_fd_), "c"(_buf_));
