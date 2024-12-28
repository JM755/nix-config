
## Underscore to d/dx between option and var (when name already used by option). e.g. "font_" as below.
## To do:
##  - https://github.com/Frost-Pheonix/nixos-config/blob/main/modules/home/waybar
{ config, lib, pkgs, inputs, ... }:
let ## global vars
  windowManager = "${pkgs.hyprland}/bin/Hyprland";
  defaultUser   = "James";
  timeZoneAU    = "Australia/Brisbane";
  locale        = "en_US.UTF-8";
  privUserGroup = "@wheel"; 
  font_         = "Lat2-Terminus16";

  wallpaperMode = "fill";
in
{    
  imports =
    [
      ./modules/home-manager/default.nix
      ./modules/users/default.nix
      ./modules/packages/default.nix
      ./modules/bootconfig/default.nix
    ];
  security.rtkit.enable = true;
  security.pam.services.hyprlock = {};
  security.sudo.extraConfig = ''
    Defaults  timestamp_timeout=60
    '';

  programs = {
    dconf.enable = true;
    java.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  fonts.packages = with pkgs; [
    meslo-lg
    roboto
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  services = {
    libinput.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    dnsmasq.enable = true;
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          user    = "${defaultUser}";
          command = "${windowManager}";
        };
        default_session = {
          command = "${windowManager}";
        };
      };
    };
    pipewire = { 
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig.pipewire-pulse = {
        "01-patch-bluetooth" = {
          "pulse.cmd" = [
            { "cmd" = "load-module"; "args" = "module-switch-on-connect"; }
          ];
        };
      }; 
      wireplumber.enable = true;
      ## Fixes pop when starting audio playback (caused by node suspending on inactivity.)
      ## See Arch Wiki pipewire page for info.
      wireplumber.extraConfig = {
      ## https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/bluetooth.html
      ## https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/components_and_profiles.html

        "01-define-bluez-roles" = {
          "monitor.bluez.properties" = [
            {
              "bluez5.roles" = [ "a2dp_sink" "hfp_ag" ];
            }
            { 
              "bluez5.codecs" = [ "sbc" "sbc_xq" "aac" ];
            }
          ];
        };

        "002-disable-suspension" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                { "node.name" = "~alsa_input.*"; }
                { "node.name" = "~alsa_output.*"; }
              ];

              actions = {
                update-props = { 
                  "session.suspend-timeout-seconds" = "0"; 
                };
              };
            }
          ]; 
          "monitor.bluez.rules" = [
            {
              matches = [
                { "node.name" = "~bluez_input.*"; }
                { "node.name" = "~bluez_output.*"; }
              ];
              actions = {
                update-props = { 
                  "session.suspend-timeout-seconds" = "0"; 
                };
              };
            }
          ];   
        };
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl  
    ];
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ 
      intel-vaapi-driver 
    ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = "true";
        ControllerMode = "dual"; #bredr
        FastConnectable = "true";
      };
      Policy.AutoEnable = "true";
      LE.EnableAdvMonInterleaveScan = "true";
    };
  };    
  networking = {
    networkmanager.enable = true;
#    firewall.allowedTCPPorts = [ 
#      27036 ## Steam Remote Play
#      27037
#    ];
#    firewall.allowedUDPPorts = [
#      27031 ## Steam Remote Play
#      27036 
#    ];
  };

  time.timeZone = "${timeZoneAU}";
  i18n.defaultLocale = "${locale}";
  console = {
    font = "${font_}";
    useXkbConfig = true;
  };
  
  xdg.menus.enable = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    allowed-users = [ "${privUserGroup}"];
    trusted-users = [ "${privUserGroup}"];
    warn-dirty = false;
  };

  system.stateVersion = "24.05"; #first ver. of nix used on your machine. Don't change!
}
