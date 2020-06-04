; Programmer and ID: Syed Faiz and 1595939
; Creation Date: 07/05/20

; Calculating a Factorial using loop and recursion                  (LabExercise14.asm)

; This program uses recursion to calculate the
; factorial of an integer.

INCLUDE Irvine32.inc
.data
msg1 byte "The output from the recursive call -", 0
msg2 byte "The output from the loop call - ", 0
msg3 byte " The factorial value is overflowed",0
exc1 byte "!",0
number DWORD 15

.code
Factorial PROTO
main PROC
	mov  edx, OFFSET msg1
	call WriteString
	mov eax, number
	call WriteDec
	mov edx, OFFSET exc1
	call WriteString
	call Crlf
	push number
	invoke Factorial   ;calculate factorial inside eac
	jo Overflow
	call WriteDec
	call Crlf
	;push 5				; calculate 5 factorial
	;call Factorial		; calculate factorial (eax)
	;call WriteDec		; display it
	;call Crlf

Factorial_Loop PROTO

	mov  edx, OFFSET msg2
	call WriteString
	mov eax, number
	call WriteDec
	mov edx, OFFSET exc1
	call Crlf
	push number			; calculate 5 factorial
	invoke Factorial_loop	; calculate factorial (eax)
	call WriteDec		; display it
	call Crlf
	exit

Overflow:
	mov edx,OFFSET msg3
	call WriteString
	call crlf
	exit
main ENDP

Factorial PROC
	push ebp
	mov  ebp,esp
	mov  eax,[ebp+8]	; get n
	cmp  eax, 1			; n < 1? for the base case 1 and 0
	ja   L1				; yes: continue
	mov  eax,1			; no: return 1
	jmp  L2

L1:	dec  eax
	push eax			; Factorial(n-1)
	;call Factorial
	invoke Factorial

; Instructions from this point on execute when each
; recursive call returns.

ReturnFact:
	mov  ebx,[ebp+8]   	; get n
	mul  ebx          	; ax = ax * bx

L2:	pop  ebp			; return EAX
	ret  4				; clean up stack
Factorial ENDP

Factorial_loop PROC  ; use a loop to calculate the factorial value
	push ebp
	mov  ebp,esp
	mov  ecx,[ebp+8]	; get n
	mov  eax, 1
L1:	cmp  ecx, 0			; check if ecx == 0 then quit
	jz   L2
	mul  ecx			; otherwise multiple eax with ecx
	loop L1
L2:	pop  ebp			; return EAX
	ret  4				; clean up stack
Factorial_loop ENDP
END main