; LabExercise5.asm
; Programmer names: Eric and Syed
; ID: 1450473 & 1595939

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
 arrayD DWORD 1,2,3,4

.code
main proc
 	mov eax, [arrayD+12]
    xchg eax, arrayD
    xchg [arrayD+12], eax
    mov eax, [arrayD+8]
    xchg eax, [arrayD+4]
    xchg [arrayD+8], eax
	invoke ExitProcess,0
main endp
end main