#pragma once
#include "types.h"

#define O_RDONLY 00
#define O_WRONLY 01

void print(const char* str, size_t len);

int open(const char* pathname, int flags, int mode);
void close(int fd);
ssize_t read(int fd, char* buffer, size_t size);
ssize_t write(int fd, const char* buffer, size_t size);

struct stat {
  unsigned short st_dev;    // ID of device containing file
  unsigned short st_ino;    // inode number
  unsigned short st_mode;   // protection
  unsigned short st_nlink;  // number of hard links
  unsigned short st_uid;    // user ID of owner
  unsigned short st_gid;    // group ID of owner
  unsigned short st_rdev;   // device ID (if special file)
  size_t         st_size;   // total size, in bytes
  unsigned long  st_atime;  // time of last access
  unsigned long  st_mtime;  // time of last modification
  unsigned long  st_ctime;  // time of last status change
  unsigned long  padding[1024];
};

int fstat(int fd, struct stat *buf);
