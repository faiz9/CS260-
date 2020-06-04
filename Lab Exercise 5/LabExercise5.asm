; LabExercise5.asm - move 16 bit registers to 32-bit registers
; Programmer names: Syed 1595939 and Eric 1450473 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
dat1 dw 100
dat2 dw -100

.code
main proc
mov ax, dat1
mov bx, dat2
;mov eax, ax
;mov ebx, bx 
movsx eax, ax
movsx ebx, bx

	invoke ExitProcess,0
main endp
end main