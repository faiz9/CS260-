; Copying a String (CopyStr.asm)
; This program copies a string.
; Programmer names: Eric and Syed
; ID: 1450473 & 1595939


.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
source  byte  "This is the source string",0
target  byte  SIZEOF source DUP(0),0

.code
main proc

	mov  esi, OFFSET source 	; indirect addressing register
	add  esi, [SIZEOF source - 2]
	mov  edi, OFFSET target	                        ; indirect addressing register
	mov  ecx, SIZEOF source	                        ; loop counter
L1:
	mov  al, [esi]	; get a character from source
	mov  [edi],al	        ; store it in the target
	dec  esi				; move to next character
	inc  edi				; move to next character
	loop L1					; repeat for entire string

	mov esi, OFFSET target     ; offset of variable
    mov ebx, 1                 ; byte format
    mov ecx, SIZEOF target-1   ; counter

	invoke ExitProcess,0
main endp
end main