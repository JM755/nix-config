{ config, pkgs, ...  }:
{
  imports = [
    ./hyprland.nix
    ./alacritty.nix
    ./waybar.nix
    ./nocodium.nix
  ];
}


