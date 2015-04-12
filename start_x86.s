# Code
section .text
extern heap_init
extern main

global _start
_start:
  call  heap_init
  xor   ebp, ebp         ; zero ebo as recomended by ABI spec
  pop   esi              ; pop argc into esi
  mov   ecx, esp         ; move argv to ecx
  and   esp, 0FFFFFFF0h  ; mask clears bottom 4 bits, 16 byte align
  push  ecx              ; push argv
  push  esi              ; push argc
  call  main
  mov   ebx, eax
  mov   eax, 1
  int   0x80

; Initialized Data
;section .data

; Uninitialized Data
;section .bss
