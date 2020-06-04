; LabExercise4.asm
; Programmer Names: Syed, Eric, Dylan

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
 	mov	eax,20
	mov	ebx,15
	mov	ecx,10
	mov	edx,5
	
	add	eax,ebx
	add ecx, edx
	
	sub ecx, edx			

	invoke ExitProcess,0
main endp
end main