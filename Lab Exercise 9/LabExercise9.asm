;Programmer: Syed Faiz
;Date Creation: 03/25/20
;LabExercise9.asm //Boolean operators

;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data
msg1 BYTE "Enter the first 32-bit hexadecimal operand:  ", 0
msg2 BYTE "Enter the second 32-bit hexadecimal operand: ", 0
result BYTE "The 32-bit hexadecimal result is:            ", 0
boolAND BYTE "Boolean AND", 0
boolOR  BYTE "Boolean OR", 0
boolNOT BYTE "Boolean NOT", 0
boolXOR BYTE "Boolean XOR", 0

.code
main PROC
;get first hexadecimal number
	mov edx, OFFSET msg1
	call WriteString
	call ReadHex
	mov ebx, eax
;get second hexadecimalnumber
	mov edx, OFFSET msg2
	call WriteString
	call ReadHex
	call Crlf
;Bool AND
	pushad
	and eax, ebx
	mov edx, OFFSET boolAND
	call WriteString
	call Crlf
	mov edx, OFFSET result
	call WriteString
	call WriteHex
	call Crlf
	popad
;Bool OR
	pushad
	or eax, ebx
	mov edx, OFFSET boolOR
	call WriteString
	call Crlf
	mov edx, OFFSET result
	call WriteString
	call WriteHex
	call Crlf
	popad
;Bool NOT
	pushad
	not eax
	mov edx, OFFSET boolNOT
	call WriteString
	call Crlf
	mov edx, OFFSET result
	call WriteString
	call WriteHex
	call Crlf
	popad
;Bool XOR
	pushad
	xor eax, ebx
	mov edx, OFFSET boolXOR
	call WriteString
	call Crlf
	mov edx, OFFSET result
	call WriteString
	call WriteHex
	call Crlf
	popad

	Invoke ExitProcess,0
main endp
end main