{ config, pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
#    sharedModules = [{}];
  };
  nixpkgs.config.allowUnfreePredicate = _: true;
}

