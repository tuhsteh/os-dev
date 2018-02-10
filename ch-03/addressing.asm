;
; A simple boot sector program that demonstrates addressing.
;
  mov ah, 0x0e          ; int 10/ah = 0eh -> scrolling teletype BIOS routine
  ; FIRST ATTEMPT
  mov al, the_secret
  int 0x10              ; Does this print an X?

  ; SECOND ATTEMPT
  mov al, [the_secret]  ; Does this print an X?
  int 0x10

  ; THIRD ATTEMPT
  mov bx, the_secret
  add bx, 0x7c00
  mov al, [bx]
  int 0x10              ; Does this print an X?

  ; FOURTH ATTEMPT
  mov al, [0x7c1e]
  int 0x10              ; Does this print an X?

  jmp $                 ; Jump forever.



the_secret:
  db "X"

; Padding and magic BIOS number.

  times 510-($-$$) db 0
  dw 0xaa55

