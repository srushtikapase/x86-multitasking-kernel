ORG 0       ;sets the origin of our program so nasm knows how to offset
BITS 16     ;tells nasm we are going to use 16 bit instructions for our program
_start:
    jmp short start
    nop

times 33 db 0       ;filling 33 bytes with 0 because some BIOS overwrite the starting bytes with own data.(BIOS Parameter Control Block) 

start:              ;label
    jmp 0x7c0:step2 ;setting code segment register as 0x7c0

handle_zero:        ;making our own handle divide by zero interrupt invoked by processor(int 0)
    mov ah, 0eh
    mov al,'0'
    mov bx,0
    int 0x10
    iret            ;for ending interrupt we must do iret otherwise it will keep executing that interrupt

handle_one:         ;making our own interupt 1. There are 256 interrupts each taking 4B space in order.(2B: offset,2B: segment)
    mov ah,0eh      ;calling that interrupt we can give decimal or hex and then it will calculate that absolute address
    mov al,'1'      ;and start executing handler code at that address
    mov bx,0        ;Interrupt Vector Table(IVT) is the first thing in RAM
    int 0x10
    iret

step2:
    cli             ;clear interrupts (also disables them so they dont pause our code execution next)
    mov ax,0x7c0
    mov ds,ax       ;setting data segment register
    mov es,ax       ;setting extra register
    mov ax,0x00     
    mov ss,ax       ;setting stack segment register
    mov sp,0x7c00   ;setting stack pointer(it grows down)
    sti             ;enables interrupts
    mov word[ss:0x00],handle_zero   ;moving 2B of offset into ss+offset. We use ss as its zero, otherwise by def it will use ds
    mov word[ss:0x02],0x7c0         ;moving 2B of segment.
    mov ax,0
    div ax                          ;forcefully invoking div by zero exception
    mov word[ss:0x04],handle_one    ;doing the same for interrupt 1
    mov word[ss:0x06],0x7c0
    int 1                           ;we can always call interrupt like this also
    mov si,message  ;move the address of label message to the si register essentially pointing to first char 'h'
    call print      
    jmp $           ;jumps to itself, infinite loop

print:
    mov bx,0        ;setting the page and background, for now we dont care
.loop:              ; we use . in front of label to make it a sublabel inside a label
    lodsb           ;loads the value the si reg is pointing to, to the al register and then moves the si pointer ahead
    cmp al,0        ;compares al with 0
    je .done        ;je is used to say jump if equal to another sublabel done which returns
    call print_char 
    jmp .loop       ;keeps the loop going
.done:
    ret

print_char:
    mov ah,0eh      ;0eh is specific here to print a char on the screen which is there in al register
    int 0x10        ;interrupt 10 is provided by BIOS which has same interrupts for all computers. It prints the char on screen
    ret

message: db 'Yes I am so happy to make my own kernel!', 0       ;db is for databytes and 0 is terminating char

times 510-($ -$$) db 0  ; times is used to extend the size of the program to atleast 510 bytes with padding 0 at rest
dw 0xAA55               ;dw is dataword (2 B), used here to put exact word (0x55AA : boot signature) ain reverse as it uses little endian