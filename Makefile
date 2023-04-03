all:
	clang++ -Wall -O2 -c main.cpp
	ld.lld --entry KernelMain main.o -o kernel.elf

run: all
	mkdir -p qemu/EFI/BOOT
	cp ~/edk2/Build/BootLoaderPkg/DEBUG_CLANG38/X64/BootLoader.efi qemu/EFI/BOOT/BOOTX64.EFI
	cp kernel.elf qemu
	qemu-system-x86_64 \
	-drive if=pflash,format=raw,file=boot/OVMF_CODE.fd \
	-drive if=pflash,format=raw,file=boot/OVMF_VARS.fd \
	-drive if=ide,format=raw,file=fat:rw:qemu

clean:
	rm -rf main.o kernel.elf qemu
