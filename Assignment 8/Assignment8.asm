; Assignment 8: [Random Strings]

; Programmer: Syed Faiz

; Creation: 03/23/20

INCLUDE Irvine32.inc

strLen=20

.data
arr BYTE strLen DUP(?)

.code
main PROC
	 call Clrscr
       mov esi, offset arr
       mov ecx, 20
       L1:
     call CreateRandomString
       Loop L1
       call WaitMsg

	exit
main ENDP

 CreateRandomString PROC USES ecx  
       mov ecx, lengthOf arr
       L2:
           mov eax, 26          ;26 alphabets
           call RandomRange
           add eax, 65          ;ascii character
           mov [esi], eax
           call WriteChar       ;write character
       loop L2      
       call Crlf
       ret
   CreateRandomString ENDP

END main