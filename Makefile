all:
	nasm -f bin real-mode/boot.asm -o real-mode/boot.bin
	dd if=real-mode/message.txt >> real-mode/boot.bin
	dd if=/dev/zero bs=512 count=1 >> real-mode/boot.bin