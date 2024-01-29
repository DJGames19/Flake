{config, pkgs, ...}:

{
  
  # Hostname
  networking = {
    hostName = "Snow-Demon";
  };

  # QEMU/KVM and libvirtd + Podman
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu =  {
        swtpm = {
	  enable = true;
	};
	ovmf = {
	  enable = true;
	};
      };
    };

    podman = {
      enable = true;

      # Docker alias for Podman
      dockerCompat = true;

      # Containers want to talk to each other
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

  users.users.djgames = {
    isNormalUser = true;
    description = "DJGames";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox-wayland
      kate
    #  thunderbird
    ];
  };

  # Z-Shell instead of Bash for user djgames
  users.users.djgames.shell = pkgs.zsh;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    xdg-user-dirs
    btop
  #  (steam.override { withJava = true; })
    discord
    tdesktop
  #  blender
    onlyoffice-bin
    minecraft
  #  python311Packages.streamdeck
    neofetch
    htop
    killall
    pfetch
    conky
    virt-manager
    win-virtio
    distrobox
    skanlite
    bottles
    lutris
    flightgear
    libreoffice
    brave
    starship
  #  wget
  ];
}
