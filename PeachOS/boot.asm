ORG 0x7c00
BITS 16


start:
  mov si, message ; Read address of 'message'
  call print
  jmp $

print:
  mov bx,0 ; Page number
.loop:
  lodsb ; Load byte into AL from SI register
  cmp al,0
  je .done
  call print_char
  jmp .loop
.done:
  ret
print_char:
  mov ah, 0eh ;  Display a character on the screen, advancing the cursor and scrolling the screen as necessary
  int 0x10 ; Video teletype output AL=char to write BH=page number BL=foreground color (later)
  ret

message: db 'Hello, World!', 0
times 510 - ($-$$) db 0
dw 0xaa55