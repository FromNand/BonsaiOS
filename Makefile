SHELL = /bin/bash

all:
	mkdir -p image/EFI/BOOT
	cd $$HOME/edk2 && source edksetup.sh && build
	cp $$HOME/edk2/Build/BootLoaderPkg/DEBUG_CLANG38/X64/BootLoader.efi image/EFI/BOOT/BOOTX64.EFI
	clang++ -Wall -c main.cpp
	ld.lld --entry KernelMain --image-base 0x100000 main.o -o image/kernel.elf

qemu: all
	qemu-system-x86_64 -monitor stdio \
	-drive if=pflash,format=raw,file=$$HOME/osbook/devenv/OVMF_CODE.fd \
	-drive if=pflash,format=raw,file=$$HOME/osbook/devenv/OVMF_VARS.fd \
	-drive if=ide,format=raw,file=fat:rw:image

server: all
	cd image && python3 -m http.server 8000

clean:
	rm -rf main.o image
