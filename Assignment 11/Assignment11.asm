;Programmer Name: Syed Faiz
;ID:1595939
;Date of Creation: 04/14/2020
;Assignment 10: Create an Encryption and Decryption Program Using Rotate
INCLUDE Irvine32.inc
BufSize = 128

.data
key BYTE -2,4,1,0,-3,5,2,-4,-4,6
msg1 BYTE "Please enter one plain text: ",0           
msg2 BYTE "The plain text after encoded: ",0             
secret BYTE BufSize DUP (?)

.code
main PROC
	mov edx, OFFSET msg1
	call WriteString
	call Crlf
	mov edx, OFFSET secret
	mov ecx, SIZEOF secret
	call ReadString
	call Crlf
	mov edx, OFFSET msg2
	call WriteString
	call Crlf
	mov edx, OFFSET secret
	call WriteString
	call crlf
	mov esi, OFFSET key
	call Encryption
	call Crlf
	mov edx, OFFSET secret
	call WriteString
	call Crlf
	exit
main ENDP

Encryption PROC
pushad
mov edi,0
rotate:
mov al, [edx]
mov cl, [esi+edi]
ror al, cl ;if cl is positive works as it is otherwise ror works as rol
mov [edx],al ;save encrypted text
inc edx ;point to next character
inc edi ;increment index to point to next
cmp edi,10
JNE continue
mov edi,0
continue:
mov bl,[edx]
cmp bl,0
je endloop
jmp rotate
endloop:
popad
ret
Encryption ENDP


END main