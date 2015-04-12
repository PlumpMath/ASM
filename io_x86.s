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

; struct stat {
;   unsigned short st_dev;    // ID of device containing file
;   unsigned short st_ino;    // inode number
;   unsigned short st_mode;   // protection
;   unsigned short st_nlink;  // number of hard links
;   unsigned short st_uid;    // user ID of owner
;   unsigned short st_gid;    // group ID of owner
;   unsigned short st_rdev;   // device ID (if special file)
;   size_t         st_size;   // total size, in bytes
;   unsigned long  st_atime;  // time of last access
;   unsigned long  st_mtime;  // time of last modification
;   unsigned long  st_ctime;  // time of last status change
; };

; int fstat(int fd, struct stat* buf);
global fstat
fstat:
  push  ebx
  mov   ebx, [esp + 0x08]
  mov   ecx, [esp + 0x0c]
  mov   eax, 28
  int   0x80
  pop   ebx
  ret
