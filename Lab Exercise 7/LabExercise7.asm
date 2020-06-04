;updatedRevStr.asm
; updated from Reversing a String (RevStr.asm)
; This program reverses a string from the user's input
; print out the outupt on the console

;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
aName BYTE 50 DUP(?)
nameSize dd ?

.code
main proc
; print the original string in the console
mov  edx, OFFSET aName ;buffer size-1
mov ecx, 50
call ReadString	
mov nameSize, eax

; Push the name on the stack.
mov	 ecx,nameSize
mov	 esi, 0

L1:	movzx eax, aName[esi]	; get character
	push eax				; push on stack
	inc	 esi
	loop L1

; Pop the name from the stack in reverse
; and store it in the aName array.

mov	 ecx, nameSize
mov	 esi, 0

L2:	pop  eax				; get character
	mov	 aName[esi],al		; store in string
	inc	 esi
	loop L2
; print out the reversed string in the console
mov  edx, OFFSET aName
call WriteString
call Crlf
	Invoke ExitProcess,0
main endp
end main