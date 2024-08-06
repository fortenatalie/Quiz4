section .data
        x dd 5
        y dd 4
        z dd 3

section .text
        global  _start

_start:
        push DWORD[x]
        push DWORD[y]
        push DWORD[z]
        call addallthree
        mov eax, 1
        int 0x80
        

addallthree:
        push ebp
        mov ebp, esp
        sub esp, 4

        mov eax, DWORD[ebp+8]
        mov ebx, DWORD[ebp+12]
        mov ecx, DWORD[ebp+16]
        add eax, ebx
        add eax, ecx
        mov [result], eax

        mov esp, ebp
        pop ebp
        ret

section .bss
        result resb 1
