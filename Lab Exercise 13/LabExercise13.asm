;Chapter 8 Lab Exercise
;Syed Faiz 1595939
;04/28/20

;Implement the ArrayFill procedures in three different ways:
;1.push/pop ebp manually in the statements (ArrayFill1)
;2.Use Enter & Leave instructions (ArrayFill2)
;3.Use the LOCAL directive (ArrayFill3)

INCLUDE Irvine32.inc

.data
count = 25
array DWORD COUNT DUP(?)
;UPPER DWORD 200
;LOWER DWORD -100
msg1 BYTE "===The Output from ArrayFill1===", 0
msg2 BYTE "===The Output from ArrayFill2===", 0
msg3 BYTE "===The Output from ArrayFill3===", 0

.code
main PROC
	;call Randomize
	push OFFSET array
	push COUNT
	call ArrayFill1
	;call ArrayFill2
	;call ArrayFill3
	mov ecx, count
        mov esi, 0
        mov edx, OFFSET msg1
        call WriteString
	call CRLF
	;exit
L1:
	mov eax, array[esi]
	call WriteInt
	call CRLF
	add esi, type array
	Loop L1
	call CRLF
	push OFFSET array
	push count
	call ArrayFill2
	mov ecx, count
	mov esi, 0
	mov edx, OFFSET msg2
	call WriteString
	call CRLF
L2:
	mov eax, array[esi]
	call WriteInt
	call CRLF
	add esi, type array
	Loop L2
	call CRLF
	push OFFSET array
	push count
	call ArrayFill3
	mov ecx, count
	mov esi, 0
	mov edx, OFFSET msg3
	call WriteString
	call CRLF
L3:
	mov eax, array[esi]
	call WriteInt
	call CRLF
	add esi, type array
	Loop L3
	exit

main ENDP


ArrayFill1 PROC	
	push ebp
	mov	ebp, esp
	pushad
	mov	esi, [ebp+12]
	mov	ecx, [ebp+8]
	cmp	ecx, 0
	je L2
L1:
	mov eax, 300
	call RandomRange
	sub eax, 100
	mov	[esi], eax
	;call WriteInt
	;call CRLF
	add	esi, TYPE DWORD
	loop L1
L2:	
	popad
	pop	ebp
	ret	8
ArrayFill1 ENDP

ArrayFill2 PROC
	enter 0,0 ; local dword
	pushad
	mov	esi, [ebp+12]
	mov	ecx, [ebp+8]
	cmp	ecx, 0
	je L2
L1:
	mov eax, 300
	call RandomRange
	sub eax, 100
	mov	[esi], eax
	;call WriteInt
	;call CRLF
	add	esi, TYPE DWORD
	loop L1
L2:	popad
	leave
	ret	8

ArrayFill2 ENDP

ArrayFill3 PROC
	LOCAL var:DWORD
	pushad
	mov	esi, [ebp+12]
	mov	ecx, [ebp+8]
	cmp	ecx, 0
	je L2
L1:
	mov eax, 300
	call RandomRange
	sub eax, 100
	mov	[esi], eax
	;call WriteInt
	;call CRLF
	add	esi, TYPE DWORD
	loop L1
L2:	popad
	ret	8

ArrayFill3 ENDP
END main