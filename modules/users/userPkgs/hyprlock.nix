{ config, pkgs, ... }:{

  imports = [ ../../home-manager/default.nix ];

  home-manager.users.James.programs.hyprlock = {  
    enable = true;
    settings = {
      general = { 
        disable_loading_bar = true;
        immediate_render = true;
      };  
      input-field = {
        monitor = "";
        size = "200, 50";
        outline_thickness = 2;
        dots_center = true;        
        position = "0, -20";
        halign = "center";
        valign = "center";
      }; 
      background = {
        monitor = "";
        color = "rgba(0,0,0,1)";
        path = "~/Desktop/wallpaper.jpg";
        blur_passes = 2;
        noise = 0.3;
      };
    };
  }; 
}
