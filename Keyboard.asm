; -----------------------------------------------------------------------------------------------------
; Created 12 Jan 2020, modified 16 May 2022.
; -----------------------------------------------------------------------------------------------------

BITS 16
org 0x7c00                ; BIOS address.

start:

        call keyboard     ; Call the custom function "keyboard".

printchar:

        mov ah,0x0e       ; Teltype function.
        int 0x10          ; Video mode.
        ret               ; Return.

keyboard:

        mov ax,0x00       ; Get keyboard input.
        int 0x16          ; Keyboard function.

        mov ah,0x0E       ; Display input char.
        int 0x10

        call keyboard     ; The infinite loop for keyboard.
        ret               ; Return.

times 510 - ($-$$) db 0   ; Fill rest of the sector with 0.
dw 0xaa55                 ; Boot Signature.

; END OF BOOTLOADER    
