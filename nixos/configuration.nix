{ config, pkgs, ... }:

{

  imports = [
    ./dev-pkgs.nix
    ./kde.nix
    ./gaming.nix
  ];

  # Bootloader, Kernel etc.
  boot = {
    # Bootloader
    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };

    # Use the Zen Kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Disable software RAID
    swraid = {
      enable = false;
    };
  };

  # Networking
  networking = {
    networkmanager = {
      enable = true;
    };

  #  wireless.enable = true;
  };

  # Hardware
  hardware = {
    enableAllFirmware = true;

    bluetooth = {
      enable = true;
    };

    pulseaudio = {
      enable = false;
    };
  };

  security = {
    rtkit = {
      enable = true;
    };
  };

  nix = {
    # Enable the flake command
    extraOptions = "experimental-features = nix-command flakes";
  };  

  # Enable sound
  sound.enable = true;

  # Localization
  i18n = {
    defaultLocale = "de_DE.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  services = {
    # Printer Support is important
    printing = {
      enable = true;
      drivers = [pkgs.hplipWithPlugin];
    };

    # Flatpak Support
    flatpak = {
      enable = true;
    };

    # Sound
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };

    xserver = {
      layout = "de";
      xkbVariant = "";
    };
  };

  xdg = {
    portal = {
      enable = true;
    };
  };

  # Enable Programs
  programs = {
    dconf = {
      enable = true;
    };

    zsh = {
      enable = true;
    };
  };

  # Set keymap in TTY
  console.keyMap = "de";

  # Environment Stuff
  environment = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.05";
}
