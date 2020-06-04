; Programmer: Syed Faiz
; Assignment 7

INCLUDE Irvine32.inc

.data
String byte "Please enter the lower bound: ",0
String1 byte "Please enter the upper bound: ",0
aName BYTE 51 DUP (0)
nameSize dword ?

.code
main PROC
	  call Randomize
       mov edx,OFFSET String
       call WriteString
       mov edx, OFFSET aName
       mov ecx, 50   
       call READINT
       call crlf
       mov edx,OFFSET String1
       call WriteString
       mov edx, OFFSET aName
       mov ecx, 50   
       call READINT
call Crlf

           mov ecx,30
L1:
           mov ebx,-300
           mov eax,100
call BetterRandomRange
call crlf
Loop L1
call WaitMsg
exit
main ENDP

BetterRandomRange PROC
sub eax, ebx
call RandomRange
add eax,ebx   
call WriteInt
call Crlf
ret
BetterRandomRange ENDP

END main

