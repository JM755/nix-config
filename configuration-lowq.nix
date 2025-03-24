{ config, lib, pkgs, inputs, ... }:
{
  system.nixos.tags = [ "lowq" ];
  imports = 
    [
      ./configuration.nix
      ./hardware-configuration.nix
    ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      amdvlk
    ];
    enable32Bit = true;
    extraPackages32 = with pkgs [ 
      driversi686Linux.amdvlk
    ];
  };
}

