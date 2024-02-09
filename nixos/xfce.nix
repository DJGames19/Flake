{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
        };
      };

      desktopManager = {
        xfce = {
          enable = true;
        };
      };
    };

    gvfs = {
      enable = true;
    };

    blueman = {
      enable = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment = {
    sessionVariables = {

    };

    systemPackages = with pkgs.xfce; [
      xfce4-whiskermenu-plugin
      xfce4-pulseaudio-plugin
    ];

    variables = {

    };
  };
}
