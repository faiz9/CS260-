;Programmer and ID: Syed Faiz 1595939
;Creation date: 05/18/20

INCLUDE Irvine32.inc

Str_find PROTO, pTarget:PTR BYTE, pSource:PTR BYTE

.data
target BYTE "01ABAAAAAABABCC45ABC9012",0
source BYTE "AAABA",0
str1 BYTE "The target string is: 01ABAAAAAABABCC45ABC9012 ",0
str2 BYTE 0ah,0dh,"The source string is: AAABA",0
str3 BYTE 0ah,0dh,"Source string found at position ",0
str4 BYTE " in Target string (counting from zero).",0Ah,0Ah,0Dh,0
stop      DWORD ?
lenTarget DWORD ?
lenSource DWORD ?
pos  DWORD ?   ;position

.code
main PROC
	INVOKE Str_find,ADDR target, ADDR source
	mov  pos,eax
	je   wasfound       ;zero flag returned set = found


wasfound:
	mov edx,OFFSET str1
	call WriteString
	mov edx,OFFSET str2
	call WriteString
	mov  edx,OFFSET str3
	call WriteString
	mov  eax,pos	; write position value
	call WriteDec
	mov  edx,OFFSET str4
	call WriteString

quit:
	exit

main ENDP
Str_find PROC, pTarget:PTR BYTE, pSource:PTR BYTE  

	INVOKE Str_length,pTarget	; get length of target
	mov  lenTarget,eax
	INVOKE Str_length,pSource	; get length of source
	mov  lenSource,eax
	mov  edi,OFFSET target	; point to target
	mov  esi,OFFSET source	; point to source

; index in target to stop search
	mov  eax,edi          
	add  eax,lenTarget     	
	sub  eax,lenSource     	
	inc  eax               	
	mov  stop,eax

	cld
	mov  ecx,lenSource     	
L1:
	pushad
	repe cmpsb	
	popad
	je   found	

	inc  edi	
	cmp  edi,stop	
	jmp  L1	

found:	; string found
	mov  eax,edi	;position in target of find
	sub  eax,pTarget
	cmp  eax,eax           

done:
	ret
Str_find ENDP

END main