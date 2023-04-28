

section .data
    cadena1 db 'parcia examen error',0
    cadena2 db 'es ejemplo',0
    cadena_concatenada db 50 dup(0)

section .text
    global _start
    
_start:
    mov edi, cadena1
    mov esi, cadena2
    mov ebx, cantidad
    
    mov ecx, 0
    cadena1_loop:
        mov al, [edi+ecx]
        cmp al, 0
        mov [ebx+ecx], al
        inc ecx
        jmp cadena1_loop

        
    imprimir_cadena:
        mov edx, ecx
        mov ecx, cantidad
        mov ebx, 1
        mov eax, 4
        int 0x80

        mov eax, 1
        xor ebx, ebx
        int 0x80