{ config, lib, pkgs, inputs, ... }:
{
  system.nixos.tags = [ "Thinkpad" ];
  imports = 
    [
      ./configuration.nix
      ./hardware-configuration.nix
    ];
}
