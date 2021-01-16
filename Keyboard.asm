; -----------------------------------------------------------------------------------------------------
;
; This time im a good person and i didn't add any bug, the soucre code is 100% correct, with 0 errors.
; NOTE! I've just do this simple bootloader, with a keyboard using the 0x16 function,
; becuase im too lazy to code the kernel in another sector. If you want to use this
; as kernel, you need to code the 0x13 function to read the sectors.
;
; FOR EDUCATIONAL PRUPOSES.
;
;
; -----------------------------------------------------------------------------------------------------

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
