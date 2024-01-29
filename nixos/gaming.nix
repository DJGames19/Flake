{ config, pkgs, ... }: {

  config = {
    # Steam has it's issues
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    # Gaming-specific packages
    environment.systemPackages = with pkgs; [
      bottles
      gamemode
      lutris
      mangohud
      minecraft
      retroarch
      superTuxKart
      winePackages.stableFull
    ];
  };
}
