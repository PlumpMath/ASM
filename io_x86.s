# Code
section .text

; void print(const char* str, size_t len);
global print
print:
  push  ebx
  mov   ebx, 0x1
  mov   ecx, [esp + 0x08]
  mov   edx, [esp + 0x0c]
  mov   eax, 4
  int   0x80
  pop   ebx
  ret

; int open(const char* pathname, int flags, int mode);
global open
open:
  push  ebx
  mov   ebx, [esp + 0x08]
  mov   ecx, [esp + 0x0c]
  mov   edx, [esp + 0x10]
  mov   eax, 5
  int   0x80
  pop   ebx
  ret

; void close(int fd);
global close
close:
  push  ebx
  mov   ebx, [esp + 0x08]
  mov   eax, 6
  int   0x80
  pop   ebx
  ret

; ssize_t read(int fd, char* buffer, size_t size);
global read
read:
  push  ebx
  mov   ebx, [esp + 0x08]
  mov   ecx, [esp + 0x0c]
  mov   edx, [esp + 0x10]
  mov   eax, 3
  int   0x80
  pop   ebx
  ret

; ssize_t write(int fd, const char* buffer, size_t size);
global write
write:
  push  ebx
  mov   ebx, [esp + 0x08]
  mov   ecx, [esp + 0x0c]
  mov   edx, [esp + 0x10]
  mov   eax, 4
  int   0x80
  pop   ebx
  ret

; int fstat(int fd, struct stat* buf);
global fstat
fstat:
  push  ebx
  mov   ebx, [esp + 0x08]
  mov   ecx, [esp + 0x0c]
  mov   eax, 108
  int   0x80
  pop   ebx
  ret
