[BITS 32] ; tell asembler were in 32 bit land
global _start
extern kernel_start

CODE_SEG equ 0x08
DATA_SEG equ 0x10

_start: ; load32
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov ebp, 0x00200000
    mov esp, ebp

    ; enable A20
    in al, 0x92
    or al, 2
    out 0x92, al

    call kernel_start ; jump to C

    jmp $ 

times 512-($ - $$) db 0