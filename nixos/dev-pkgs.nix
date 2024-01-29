{ config, pkgs, ... }: {

  config = {

    programs = {
      java = {
        enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      gh
      gitFull
      gnat13
      gnome.ghex
      godot_4
      nix-prefetch-scripts
      pkg-config
      python311Full
      vscode
    ];
  };
}
