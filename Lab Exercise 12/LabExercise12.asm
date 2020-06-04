;Name and ID: Syed Faiz and 1595939
;Creation Date: 04/24/20
;LabExercise12: Extended Subtraction

Comment !
Description: Create and test a procedure named Extended_Sub that
subtracts two binary integers of arbitrary size. Restrictions: The
storage size of the two integers must be the same, and their size
must be a multiple of 32 bits.
!

INCLUDE Irvine32.inc

.data
op1 QWORD 0A2B2A40674981234h
op2 QWORD 08010870000234502h
;result QWORD 1 DUP(0)			; = 22A21D067474CD32h

msg BYTE "The difference equals ",0

; Count the number of doublewords in each operand.
; DoubleWords = SIZEOF op1 / TYPE DWORD

.code
Extended_Sub PROC
shr ecx, 1
mov edx, [esi + ecx]
mov eax, [esi]
sub eax, [edi]
sbb edx, [edi + ecx]
ret
Extended_Sub ENDP

main PROC
mov esi, offset op1
mov edi, offset op2
mov ecx, sizeof op1 ; 
call Extended_Sub
push edx
push eax
mov edx, offset msg
call writeString
pop eax
pop edx
mov ebx, eax
mov eax, edx
call writeHex
mov eax, ebx
call writeHex
	exit
main ENDP
END main
