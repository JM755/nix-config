{ config, pkgs, ... }:
{
  home-manager.users.James.programs.alacritty.enable = true;
  home-manager.users.James.programs.alacritty.settings = {
    font.normal = { family = "Meslo LG M Nerd Font"; style = "Regular"; };
    window.opacity = 0;
    colors = with config.colorScheme.palette; {
      bright = {
        black = "0x${base00}";
        blue = "0x${base0E}";
        cyan = "0x${base05}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base0F}";
        yellow = "0x${base09}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base0F}"; #01
      };
      normal = {
        black = "0x${base01}";
        blue = "0x${base0D}";
        cyan = "0x${base04}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };
      primary = {
        background = "0xFFFFFF"; #"0x${base00}";
        foreground = "0x${base0D}"; #06
      };
    };
  };
}
