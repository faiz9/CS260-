; Assignment5.asm - program that uses PTR operator and MOV instructions to copy the value from bigEndian to littleEndian, reversing the order of the bytes.
; Creation Date: 03/01/2020
; Programmer: Syed Faiz

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
;Declaring variables
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ?

.code
main proc
; mov byte ptr [bigEndian+3]
; mov byt ptr [littleEndian]
mov ah, byte ptr bigEndian
mov al, byte ptr [bigEndian+1]
mov word ptr [littleEndian+2], ax
mov ah, byte ptr[bigEndian+2]
mov al, byte ptr [bigEndian+3]
mov word ptr [littleEndian], ax	;eax=12345678h

	invoke ExitProcess,0
main endp
end main