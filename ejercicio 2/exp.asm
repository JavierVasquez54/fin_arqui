global main
%include        'stdio32.asm'

section .data
parametros db "ingrese base y numero: ", 0
resultado db "Resultado: %lld", 10, 0

section .bss
base resq 1
exp resq 1
resulta resq 1

section .text
main:
    mov edi, parametros
    xor eax, eax
    
    mov esi, base
    mov edx, exp
    xor eax, eax
    mov edi, [base]
    mov esi, [exp]
    call exp_func
    mov [resulta], eax
    
    mov edi, result
    mov esi, [result_num]
    xor eax, eax
    call printf
    xor eax, eax
    ret

exp_func:
   
    push rbp
    mov ebp, rsp
    mov eax, 1
    mov ecx, rsi
    cmp ecx, 0
    je end_loop
    loop_start:
        mul edi
        dec rcx
        jnz loop_start
    end_loop:
    
    mov esp, ebp
    pop ebp
    ret