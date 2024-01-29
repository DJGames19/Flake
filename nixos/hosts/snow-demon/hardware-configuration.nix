{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/NixOS";
      fsType = "xfs";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ee2def45-2fde-4bd7-974d-86f9fb6c2344";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  fileSystems."/home/djgames/GameSSD1" =
    { device = "/dev/disk/by-uuid/62e7c7fd-6081-40a3-847e-0cc997c7f881";
      fsType = "xfs";
      options = [ "nofail" ];
    };

  fileSystems."/home/djgames/Games_M2" =
    { device = "/dev/disk/by-uuid/c431153c-66d2-4696-8bd1-babdb9927cc4";
      fsType = "xfs";
      options = [ "nofail" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp16s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp17s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
