{ config, pkgs, ... }:
{
  home-manager.users.James.wayland.windowManager.hyprland.settings = with config.colorScheme.palette; {
    general = {
      "col.active_border" = "rgba(${base0F}00)"; #ff
      "col.inactive_border" = "rgba(${base08}00)"; #ff       
      gaps_in=20;
      gaps_out="18, 40, 40, 40"; #top, right, bottom, left
      border_size=2;
      layout="dwindle";
      resize_on_border = true;
      hover_icon_on_border = true;
    };
    dwindle = {
      default_split_ratio = 1;
    };
    decoration = {
      rounding = 7;
	shadow = {
	    render_power = 1;
            color = "rgba(${base01}ff)";
	    enabled = false;
            range = 2;
	};
 #     drop_shadow = true;
 #     shadow_range = 2;
 #     "col.shadow" = "rgba(${base01}ff)"; 
 #     shadow_render_power = 1;
      "layerrule" = [ 
        "blur,waybar"
        "blur,alacritty"
        "ignorezero,waybar"
      ];
      active_opacity = 1; # 0.7;
      inactive_opacity = 1; # 0.4;
      fullscreen_opacity = 1; # 0.8;
      dim_inactive = true;
      dim_strength = 0.1;
      blur = {
       # enabled = true;
#        xray = true;
        new_optimizations = true;
        size = 2;
        passes = 4;
      };
      dim_around = 0.5;
    };
    misc = with config.colorScheme.palette; {
      background_color = "rgba(${base01}ff)";
      vfr = true;
    };
  };
}
