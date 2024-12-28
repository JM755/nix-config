{config, pkgs, ... }: {
  home-manager.users.James.programs.waybar = {
    enable = true;
    settings = [
    {
      name = "mainBar";
      layer = "top";
      position = "top";
      spacing = 10;
      height = 40;
      output = "eDP-1";
      modules-left = [                           "custom/pad"
                        "hyprland/workspaces"    "custom/pad"
                     ]; #"group/extraWidgets" ]; #"wlr/taskbar" ];  # modules-center = [ ];
      modules-right = [                                     "custom/pad" 
                        "group/brightness" "group/sound"    "custom/pad"
                        "bluetooth" "network" "battery"     "custom/pad"
                        "clock"                             "custom/pad"
                      ];

      "custom/pad" = { format = " "; interval = "once"; tooltip = "false"; };
      "custom/sep" = { format = ""; interval = "once"; tooltip = "false"; };

      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%a %H:%M}";
	### Other Formats vvv ###
        #format-alt = "{:%a %e %b  %I:%M %p}"; #i.e. displays as:    󰃰 Mon 31 Feb  2:06 PM
        #format = "{:%I:%M %p}";  
        tooltip = false;
      };

      battery = {
        format = "{icon}";
        tooltip-format = "Battery is {capacity}% full.";
        format-icons = ["󱃍" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󱈏"];
        format-charging = "󰂄"; 
        format-full = "󱈏";
        full-at = 99;
        interval = 5;
        states = {
          warning = 20;
          critical = 10;
        };
        format-charging-warning = "󰂆 ";
        format-charging-critical = "󰢟 ";
        format-warning = "{icon} LOW";
        format-critical = "{icon} CRITICAL";
        
      };
     "group/brightness" = {
        orientation = "horizontal";
        drawer = {
          click-to-reveal = true;
          transition-duration = 100;
          transition-left-to-right = true;
        };
        modules = [ "backlight" "backlight/slider" ];
      };
      backlight = {
        format = " "; #{icon} ";
        format-icons = ["󰄰" "󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥"];
        tooltip-format = "Brightness - {percent}";
      };
      "backlight/slider" = {
        min = 0;
        max = 100;
        orientation = "horizontal";
      };
      "group/sound" = {
        orientation = "horizontal";
        drawer = {
          click-to-reveal = true;
          transition-duration = 100;
          transition-left-to-right = true;
        };
        modules = [ "pulseaudio" "pulseaudio/slider" ];
      };
      pulseaudio = {
        format = "󰕾 "; #{icon} ";
        format-muted = "󰖁 "; # {icon} ";
        format-bluetooth= "󰋋 "; # {icon} ";
        format-bluetooth-muted = "󰟎 "; # {icon} ";
        format-icons = ["󰄰" "󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥"];
        tooltip-format = "Volume - {volume}";
      };
      "pulseaudio/slider" = {
        min = 0;
        max = 100;
        orientation = "horizontal";
      };
      bluetooth = {
        format = "󰂳";
        format-connected = "󰂱";
        format-on = "󰂯";
        format-disabled = "󰂲";
        tooltip-format-connected = "󰾰   {device_alias} {device_enumerate}";        
	tooltip-format-connected-battery = "󰾰   {device_alias}   󰥉  {device_battery_percentage}\n{device_enumerate}";
        on-click = "exec blueman-manager";
      }; 
      "network" = {
        format-disconnected = "󱛅";
        format-wifi = "󱚽";
        tooltip-format-wifi = "{essid} - {signalStrength}%";
        on-click = "exec nm-connection-editor";
      };
      "wlr/taskbar" = {
        format = "{icon}";
        icon-size = 16;
        on-click = "activate";
        on-click-right = "close";
        tooltip = false;
        sort-by-app-id = true;
      };      
      "hyprland/workspaces" = {
        format =  "{icon}";
        active-only = true;
        mode = "hide";
      };
#      "group/extraWidgets" = {
#        orientation = "horizontal";
#        drawer = {
#          click-to-reveal = true;
#          transition-duration = 100;
#          transition-left-to-right = true;
#        };
#        modules = [ "gamemode" "clock#calendar" ]; #"privacy" ];
#      };
#      gamemode = {
#      };
#      privacy = {
#      };
    }
    ];
#margins: top, right, bottom, left 
    style = ''
* {
    border: none;
    font-family: "Roboto NFM:style=Regular";
    font-size: 16px;
    color: rgba(244, 218, 214, 1);
    min-height: 10px;
}
.modules-left {
    background-color: rgba(255, 255, 255, 0.01);
    min-width: 1px;
    min-height: 1px;
    border-radius: 15px;
}
.modules-right {
    background-color: rgba(255, 255, 255, 0.01);
    min-width: 1px;
    min-height: 1px;
    border-radius: 15px;
}
window#waybar.mainBar {
    background: transparent;    
}
window#waybar.mainBar > box {
    background-color: rgba(255, 255, 255, 0);
    margin-top: 20px;
    margin-left: 20px;
    margin-right: 20px;    
}
tooltip {
    background-color: rgba(54, 58, 79, 1);
}
#brightness {
    border: 1px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 9px;
    padding-right: 7px;
    margin-top: 6px;
    margin-bottom: 6px;
}
#sound {
    border: 1px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 10px;
    padding-right: 6px;
    margin-top: 6px;
    margin-bottom: 6px;
}

#backlight-slider slider {
    min-height: 0px;
    min-width: 0px;
    opacity: 0;
    background-image: none;
    border: 1px;
    border-radius: 10px;
    background-color: rgba(255, 255, 255, 0.1);
    box-shadow: none;
}
#backlight-slider trough {
    min-height: 1px;
    min-width: 100px;
    border-radius: 0px;
    background-color: rgba(73, 77, 100, 1);
}
#backlight-slider highlight {
    min-width: 3px;
    border-radius: 3px;
    background-color: rgb(237, 135, 150);
}
#pulseaudio-slider slider {
    min-height: 0px;
    min-width: 0px;
    opacity: 0;
    background-image: none;
    border: none;
    box-shadow: none;
}
#pulseaudio-slider trough {
    min-height: 1px;
    min-width: 100px;
    border-radius: 0px;
    background-color: rgba(73, 77, 100, 1);
}
#pulseaudio-slider highlight {
    min-width: 3px;
    border-radius: 3px;
    background-color: rgb(237, 135, 150);
}
#battery.charging {
    color: rgb(166, 218, 149);
}
#battery.warning {
    color: rgb(238, 212, 159); 
}
#battery.critical {
    color: rgb(237, 135, 150);
    animation-name: heartbeat;
    animation-duration: 1.5s;
    animation-timing-function: steps(100);
    animation-iteration-count: infinite;
    animation-direction: normal;
}
@keyframes heartbeat {
    82% {
        color: rgb(237, 135, 150);
    }
    92% {
        color: rgb(244, 219, 214);
    }
}

#battery.full {
    color: rgb(125, 196, 228);
}
#workspaces {
    border: 1px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 0px;
    padding-right: 0px;
    margin-top: 6px;
    margin-bottom: 6px;
}
#bluetooth {
    border: 1px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 11px;
    padding-right: 13px;
    margin-top: 6px;
    margin-bottom: 6px;
}
#network {
    border: 1px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 9px;
    padding-right: 15px;
    margin-top: 6px;
    margin-bottom: 6px;
}
#battery {
    border: 1px;
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 12px;
    padding-right: 12px;
    margin-top: 6px;
    margin-bottom: 6px;
}
#clock {
    padding-left: 0px;
    padding-right: 12px;
}
#sep {
    background-color: rgba(255, 255, 255, 0);
    padding-left: 2px;
    padding-right: 2px;
}


'';
  }; 
}

