# Code
section .text

; void heap_init();
global heap_init
heap_init:
  push  ebx
  xor   ebx, ebx              ; ebx = 0
  mov   eax, 45               ; eax = brk(ebx);
  int   0x80
  mov   [heap_ptr], eax       ; heap_ptr = (void*)eax;
  mov   [heap_pos], eax       ; heap_pos = (void*)eax;
  pop   ebx
  ret

; void* malloc(size_t size);
global malloc
malloc:
  push  ebx
  mov   ebx, [esp + 0x08]     ; ebx = size;
  add   ebx, [heap_size]      ; ebx += heap_size;
  push  ebx
  call  heap_resize           ; eax = heap_resize(ebx);
  add   esp, 4
  cmp   eax, 0                ; if (eax < 0)
  jl    abort                 ;   goto abort;
  mov   [heap_size], ebx      ; heap_size = ebx;
  add   ebx, [heap_ptr]       ; ebx += heap_ptr;
  mov   eax, [heap_pos]       ; eax = heap_pos;
  mov   [heap_pos], ebx       ; heap_pos = ebx;
  jmp   return                ; return eax
abort:
  xor   eax, eax              ; return 0
return:
  pop   ebx
  ret

; void free(void* ptr);
global free
free:
  int   0x03                  ; NYI
  ret

; void memset(void* ptr, int c, size_t size);
;global memset
;memset:
;  push  ebp
;  mov   ebp, esp
;  sub   esp, 0x10
;
;  mov   edx, [ebp + 0x08]
;  mov   ecx, [ebp + 0x0c]
;  mov   eax, [ebp + 0x10]
;  TODO: Finish this.
;
;  pop   ebp
;  ret

; int heap_resize(size_t size);
heap_resize:
  mov   ebx, [esp + 0x4]
  add   ebx, [heap_ptr]
  mov   eax, 45
  int   0x80
  ret

; Initialized Data
section .data
heap_size: dd 0

; Uninitialized Data
section .bss
heap_ptr: resd 1
heap_pos: resd 1
