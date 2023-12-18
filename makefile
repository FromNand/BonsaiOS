SHELL = /bin/bash

all:
	mkdir -p image/EFI/BOOT
	cd $$HOME/edk2 && source edksetup.sh && build
	cp $$HOME/edk2/Build/BootLoaderPkg/RELEASE_CLANG38/X64/BootLoader.efi image/EFI/BOOT/BOOTX64.EFI
	clang++ -Wall -c main.cpp
	ld.lld -e KernelMain main.o -o image/kernel.elf

qemu: all
	qemu-system-x86_64 -drive if=pflash,format=raw,file=OVMF.fd -drive format=raw,file=fat:rw:image

server: all
	cd image && python3 -m http.server

clean:
	rm -rf main.o image
