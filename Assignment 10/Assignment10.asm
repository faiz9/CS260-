;Programmer: Syed Faiz
;ID: 1595939
;Date Creation: 04/13/2020
;Boolean Calculator

INCLUDE Irvine32.inc

.data
MenuTable BYTE "Boolean Calculator", 0dh,0ah ;could have issues
BYTE 0dh,0ah
BYTE "1. x AND y", 0dh,0ah
BYTE "2. x OR y", 0dh,0ah
BYTE "3. NOT x", 0dh,0ah
BYTE "4. x XOR y",0dh,0ah  ;missing operator issue
BYTE "5. Exit Program",0
Msg1 BYTE "Enter First 32-bit integer: ",0   
Msg2 BYTE "Enter Second 32-bit integer: ",0  
result BYTE "The result is:            ",0
caseTable BYTE '1'
DWORD AND_Operation
EntrySize = ($ - caseTable )
BYTE '2'
DWORD OR_Operation
BYTE '3'
DWORD NOT_Operation
BYTE '4'
DWORD XOR_Operation
BYTE '5'
DWORD exitProgram
NumberEntries = ($ - caseTable) / EntrySize

.code
main PROC
call Clrscr ;clear console window
Menu: ;could have issues here
mov edx,OFFSET MenuTable ;could have issues here
call WriteString
call Crlf
getInput:
call ReadChar
cmp al,'5'
ja getInput
cmp al,'1'
jb getInput
call Crlf
call selectProcedure
jc quit
call Crlf
jmp Menu
quit: exit
main ENDP

selectProcedure PROC
push ebx  ;stack
push ecx  ;stack
mov ebx,OFFSET caseTable   
mov ecx, NumberEntries
L1:
cmp al,[ebx]
jne L2
call NEAR PTR[ebx+1]           ;NEARPTR issue
jmp L3
L2: add ebx, EntrySize
loop L1              ;loop issue
L3: pop ecx
pop ebx
ret
selectProcedure ENDP

AND_Operation PROC   ;and procedure starts
pushad
mov edx,OFFSET msg1
call WriteString
call ReadDec
mov ebx,eax
mov edx, OFFSET msg2
call WriteString
call ReadDec
and eax,ebx
mov edx,OFFSET result
call WriteString
call WriteDec
call Crlf
popad
ret
AND_Operation ENDP  ;AND_Operation end of procedure

OR_Operation PROC ;start procedure
pushad
mov edx,OFFSET msg1 ;first int
call WriteString
call ReadDec
mov ebx,eax
mov edx,OFFSET msg2 ;seconds int
call WriteString
call ReadDec
or eax,ebx
mov edx, OFFSET result  ;operation result
call WriteString        ;display result
call WriteDec
call Crlf
popad
ret
OR_Operation ENDP ;end procedure

NOT_Operation PROC
pushad
mov edx,OFFSET msg1
call WriteString
call ReadDec
not eax
mov edx,OFFSET result
call WriteString
call WriteDec
call Crlf
popad
ret
NOT_Operation ENDP

XOR_Operation PROC  ;start procedure
pushad
mov edx,OFFSET msg1
call WriteString
call ReadDec
mov ebx,eax
mov edx,OFFSET msg2
call WriteString
call ReadDec
xor eax,ebx
mov edx,OFFSET result
call WriteString
call WriteDec
call Crlf
popad
ret
XOR_Operation ENDP  ;end procedure

exitProgram PROC ;start procedure
stc ;carry flag1
ret ;return
exitProgram ENDP

END main