INCLUDE Irvine32.inc

.data
Sourcew WORD 10, 20, 30
Targetw WORD 10, 20, 35
WordArray WORD 10h, 20h, 30h, 40h
count1 = ($ - Targetw)/TYPE WORD
count2 = ($ - WordArray)/TYPE WORD
notSame BYTE "Source Array and Target Array are NOT the same.", 0
message BYTE "After searching, the matched word is located at: ", 0
noMatch BYTE "No match word is found 0100h", 0

.code
main PROC
	mov ecx, count1
	mov esi, OFFSET Targetw
	mov edi, OFFSET Sourcew
	cld
	repe cmpsw
	jne notEqual
	jmp done

	notEqual:
		mov edx, OFFSET notSame
	
	done:
		call WriteString
		call CRLF

	; "Use SCASW to scan for the 16-bit value in an array named wordArray, and copy the offset of the matching member into the EAX register."
	mov ecx, count2
	mov edi, OFFSET WordArray
	mov ax, 0100h
	cld
	repne scasw
	jnz nFound
	dec edi
	mov eax, edi
	jmp finish

	nFound:
		mov edx, OFFSET noMatch
		call WriteString
		call CRLF

	finish:
		mov edx, OFFSET message
		call WriteString
		call WriteHex
		call CRLF
		call WaitMsg

main ENDP
END main