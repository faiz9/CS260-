; Assignment6.asm - [Reverse an Array]
; Syed Faiz
; Creation Date: 03/10/2020

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
Array DWORD 1,2,3,4,5,6,7,8,9,10

.code
main proc
MOV ESI, OFFSET Array
MOV EDI, OFFSET Array
mov ecx, LENGTHOF Array-1
L1:
ADD EDI, TYPE Array
LOOP L1

mov ecx, LENGTHOF Array
L2:
MOV EAX, [ESI]
MOV EBX, [EDI]
XCHG EAX, EBX
MOV [ESI], EAX
MOV [EDI], EBX

ADD ESI, TYPE Array
SUB EDI, TYPE Array
DEC ECX

LOOP L2	

	invoke ExitProcess,0
main endp
end main