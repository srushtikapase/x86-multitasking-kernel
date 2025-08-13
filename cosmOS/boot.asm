ORG 0x7c00  ;sets the origin of our program so nasm knows how to offset
BITS 16     ;tells nasm we are going to use 16 bit instructions for our program

start:              ;label
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