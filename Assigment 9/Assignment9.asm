; //include Irvine32.inc
;Programmer Name: Syed Faiz
;Date of Creation: 04/11/2020
;Programmer ID: 1595939
;Assignment 9


INCLUDE Irvine32.inc

BUFMAX = 128
CIPHERMAX = 128

.data
sPrompt BYTE "Enter the plain text: ",0
cipherPrompt BYTE "Enter the key: ",0
sEncrypt BYTE "Cipher text: ",0
sDecrypt BYTE "Decrypted: ",0
buffer BYTE BUFMAX+1 DUP(0)
keyBuf DWORD ? 
cipherstr BYTE CIPHERMAX+1 DUP(0)
keySize DWORD ?
;KEY BYTE "ABXmv#7",0

.code
main PROC
	
	CALL InputTheString
	call InputCipherText
	call TranslateBuffer
	mov edx, OFFSET sEncrypt
	call DisplayMessage
	call TranslateBuffer
	mov edx, OFFSET sDecrypt
	call DisplayMessage
	
	exit
main ENDP

InputTheString PROC
pushad
mov edx, OFFSET sPrompt
call WriteString
mov ecx,BUFMAX
mov edx, OFFSET buffer
call ReadString
mov keyBuf,eax 
call Crlf
popad
ret
InputTheString ENDP

InputCipherText PROC
pushad
mov edx, OFFSET cipherPrompt
call WriteString
mov ecx,CIPHERMAX
mov edx, OFFSET cipherStr
call ReadString
mov keySize,eax
call Crlf
popad
ret
InputCipherText ENDP

DisplayMessage PROC

pushad
call WriteString
mov edx,OFFSET buffer
call WriteString
call Crlf
call Crlf
popad
ret
DisplayMessage ENDP

TranslateBuffer PROC

pushad
mov ecx, keyBuf
mov esi,0
mov edi,0
L1:
mov al,cipherStr[edi]
xor buffer[esi],al
inc esi
inc edi
cmp edi,keySize
jb L2
mov edi,0
L2: loop L1
popad
ret
TranslateBuffer ENDP
END main