{ config, lib, inputs, pkgs, ... }:{
  imports = 
  [ 
    ./userPkgs/hyprlock.nix
    ./userPkgs/default.nix 
    ./hyprlandSettings/default.nix
    ../home-manager/default.nix
    ../packages/default.nix
    inputs.nix-colors.homeManagerModules.default
    ./styling/default.nix
  ];
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato; 
  users.users = {
    James = {
      isNormalUser = true;
      home         = "/home/James";   
      extraGroups  = [ "wheel" "networkmanager" "video" ];
    };
  };

  home-manager.users.James = {pkgs, ...}: {
    home.username      = "James"; 
    home.homeDirectory = "/home/James";  
    home.stateVersion  = "24.05";
    
    programs.git.userName    = "James";
    programs.git.userEmail   = "jmburn755@gmail.com";
    programs.git.extraConfig = { 
      init.defaultBranch = "thinkpad"; 
      safe.directory     = "/etc/nixos";
    };
    wayland.windowManager.hyprland.enable = true;

    dconf.settings."org/blueman/general".plugin-list = [ "!ConnectionNotifier" ];    
    services.hyprpaper.enable = true;
    services.hyprpaper.settings = { 
      preload = [ "~/Desktop/wallpaper.jpg" ];
      wallpaper = [ 
        "eDP-1,~/Desktop/wallpaper.jpg"
#        "HDMI-A-3,~/Desktop/accretion_disk.jpg" 
#        "LVDS-1,~/Desktop/accretion_disk.jpg" ## fujitsu monitor
#        "desc:Technical Concepts Ltd LCD TV37V8 0x00000001,~/Desktop/accretion_disk.jpg" ## tv screen
      ];
    };
  };
} 












