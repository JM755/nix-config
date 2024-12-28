{ config, pkgs, lib, ... }:{ 
  programs.xwayland.enable = true; #prob easier to keep track of if here. 
  home-manager.users.James.wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
#     xwayland.force_zero_scaling = true;
      monitor = [ 
#       "eDP-1,2560x1600,auto,1.6666666" #macbook pro
        "eDP-1, 1920x1080, auto, 1"        
        ]; 
      dwindle = {
        pseudotile = true;
      };
      input = {
        kb_layout = "us";
        scroll_button_lock = true;
        sensitivity = 0.6; 
        follow_mouse=2;
        off_window_axis_events = 1;
	touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
          drag_lock = true;
          tap-to-click = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_min_fingers = 3;
      };
      animations = {
        first_launch_animation = false;
        enabled = false;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        middle_click_paste = false;
        enable_swallow = true;
        swallow_regex = "^(Alacritty)$";
        focus_on_activate = true;

      };
      windowrulev2 = [
        "workspace name:Bench, title:(Spotify)"
        ##  TAGS
        "tag +setting, class:(nm-connection-editor)"
        "tag +setting, class:(blueman-manager)"
 

        "tag +gimp, class:(.*)(gimp)(.*)"                                         ## Tag all GIMP windows
        "tag +gimp_dropdowns, floating:1, title:(GNU Image Manipulation Program)" ## identifies main window +  dropdown menus of GIMP.
        "tag gimp, tag:gimp_dropdowns"                                            ## Toggle off gimp tag from dropdowns distinguishing them from other windows.
                                                                                  ## Otherwise dropdowns appear in top left corner with other windows. 
        "float, tag:setting" ## Should tidy this   (~_~)
#        "maxsize 530 150, tag:setting"
        "move onscreen 100% 0%, tag:setting"
#        "size 530 150, tag:setting"
#        "suppressevent fullscreen maximize, tag:setting"
        "rounding 0, tag:setting"
        "bordersize 0, tag:setting"
        "decorate on, tag:setting"
        "dimaround on, tag:setting"

        "move onscreen 0% 0%, tag:gimp"
        "dimaround off, tag:gimp"
      ];
      binde = [
        ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 6.24%+"
        ", XF86AudioLowerVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 6.26%-"
        ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        ", XF86MonBrightnessUp,   exec, brightnessctl set 4%+ "
        ", XF86MonBrightnessDown, exec, brightnessctl set 4%-"
        #F3 volume up, f2, down, f1 mute/unmute, f5 dim display, f6 brighten display
      ];

      bind = [
     ## QUICK GUIDE
     ## Super ~ general use, mostly to open programs, or add 'context' to other actions.
     ## Shift ~ move things around. e.g. move focus, windows, windows to workspaces.
     ## Alt   ~ Workspace action. e.g. create/move spaces, move windows to spaces. (+shift key)

        "$mod, e    , exit"
        "$mod, x    , killactive"
        "$mod, slash, exec, alacritty --working-directory \"/etc/nixos\"" #  --socket \"$XDG_RUNTIME_DIR/alacritty.sock\"
        "$mod, space, exec, alacritty"
        "$mod, v    , exec, ${pkgs.alacritty}/bin/alacritty -e nvim -R"
        "$mod, f    , exec, ${pkgs.firefox}/bin/firefox"        
        "$mod, l    , exec, ${pkgs.hyprlock}/bin/hyprlock"
        "$mod, s    , exec, spotify"

        "$mod SHIFT, f    , togglefloating"
        "$mod SHIFT, space, fullscreen, 2"
  
        "SHIFT, Left , movefocus, l"
        "SHIFT, Right, movefocus, r"
        "SHIFT, Up   , movefocus, u"
        "SHIFT, Down , movefocus, d"

        "$mod SHIFT, Left , movewindow, l"
        "$mod SHIFT, Right, movewindow, r"
        "$mod SHIFT, Up   , movewindow, u"
        "$mod SHIFT, Down , movewindow, d"

        "ALT, Left , workspace, -1"
        "ALT, Right, workspace, +1"
        "ALT, space, workspace, name:Bench"

        "ALT SHIFT, Left , movetoworkspace, -1"
        "ALT SHIFT, Right, movetoworkspace, +1"
        "ALT SHIFT, space, movetoworkspace, name:Bench"

        "ALT, a , movetoworkspacesilent, -1"
        "ALT, d, movetoworkspacesilent, +1"
        "ALT, s, movetoworkspacesilent, name:Bench"
      ];
      exec-once = [
        "hyprctl setcursor phinger-cursors-dark 10"
        "hyprlock"
        "alacritty --working-directory /etc/nixos"  # --socket \"$XDG_RUNTIME_DIR/alacritty.sock\""
        "${pkgs.firefox}/bin/firefox"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.waybar}/bin/waybar"
        "renameworkspace, 1 Bench"
        "[workspace name:Bench silent] easyeffects"
#        "nwg-dock-hyprland"
#        "hypridle"
      ];
    };
  };
}

