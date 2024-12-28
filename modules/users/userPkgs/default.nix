{ config, pkgs, ... }:{
  nixpkgs.config.allowUnfreePredicate = _: true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.James.home.packages = with pkgs; [
    hyprland
    hyprland-qtutils
    hyprpicker
    hyprpaper
    swww
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
    wofi
    wlroots
    hyprcursor
 
    git
    vim 
    gimp-with-plugins
    musescore
  ];
  home-manager.users.James.programs = {
    bash.enable = true;
    git.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  }; 
}
