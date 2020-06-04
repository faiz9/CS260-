; Programmer: Syed Faiz
; ID: 1595939
; Creation Date: 05/04/20
INCLUDE Irvine32.inc

.data
gcdresult DWORD 0
str1 BYTE "The Greatest common divisor of ", 0  ;str1
str2 BYTE " and ", 0 
str3 BYTE " is: ", 0
list1 DWORD 35,72,31,128,121
list2 DWORD 15,18,17,640,0

.code
gcd PROC
enter 8,0
mov eax, [ebp + 8]  ; get n / multiply
mov ebx, [ebp + 12]
cmp ebx, 0   ;compare eax 
jz gcd1
cmp eax, ebx
jae AGrThB
xchg eax, ebx
AGrThB:
cmp ebx, 0
jz gcd1
mov edx, 0 ; div
div ebx
cmp edx, 0
jz gcd2
mov [ebp-4], ebx
mov [ebp-8], edx

call gcd
gcd2:
mov gcdresult, ebx
jmp done
gcd1:
mov gcdresult, eax
done:
leave
ret
GCD ENDP

main PROC
mov ecx, 5 ;calculate 5 factorial
mov esi, offset list1 
mov edi, offset list2
L1:

push [esi]
push [edi]
call gcd
mov edx, offset str1
call writestring  ;display it
mov eax, [esi]
call writedec
mov edx, offset str2
call writestring
mov eax, [edi]
call writedec
mov edx, offset str3
call writestring
mov eax,  GCDResult
call writedec
call crlf

add esi, 4
add edi, 4
loop L1

	exit
main ENDP
END main