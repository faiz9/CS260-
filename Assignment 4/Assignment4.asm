; AddTwoSum.asm - Chapter 3 example.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;For unsigned 32 bit variables
.data
valueA DWORD 1000
valueB DWORD 500
valueC DWORD 450
valueD DWORD 100
sum DWORD 0


.code
main proc
    mov eax, valueA
	mov ebx, valueB
	mov ecx, valueC
	mov edx, valueD

	add	eax, ebx
	add ecx, edx
	
	sub eax, ecx
					
	mov sum, eax

	invoke ExitProcess,0
main endp
end main