[Defines]
    PLATFORM_NAME           = BootLoaderPkg
    PLATFORM_GUID           = 534a8974-ad67-4541-8758-b0f98d04cf0a
    PLATFORM_VERSION        = 1.0
    DSC_SPECIFICATION       = 0x00010005
    OUTPUT_DIRECTORY        = Build/BootLoaderPkg
    SUPPORTED_ARCHITECTURES = X64
    BUILD_TARGETS           = DEBUG|RELEASE|NOOPT

[LibraryClasses]
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
    UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
    BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
    BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
    DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
    DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
    MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
    PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
    PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
    RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
    UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
    UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf

[Components]
    boot/boot.inf
