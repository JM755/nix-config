
{ config, lib, pkgs, ... }:

{    
  environment.systemPackages = with pkgs; [
    refind
    wayland-protocols
    wayland-utils
    wl-clipboard
    pavucontrol
    networkmanagerapplet
    ethtool
    brightnessctl
    colord
    phinger-cursors
    nwg-look
    nwg-dock-hyprland
    nwg-drawer
    alsa-lib
    alsa-utils
    alsa-tools
    sof-firmware
    unzip

    #file manger/explorer
    jq #json preview
    poppler #pdf preview
    ueberzugpp #image display

    intel-gpu-tools
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    mesa
    mesa-demos
    libva
    libva-utils
    pciutils
    clinfo

    easyeffects
    protonup
    mangohud

    brave
    spotify
    vim
    wget
    mtr
    neofetch
    signal-desktop
    vlc
    libvlc
    libreoffice-qt
    hunspell
    hunspellDicts.en_AU
    obsidian
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "/home/James/.steam/root/compatibilitytools.d";
  };
  programs = {
    gamemode.enable = true;
#    gamescope.enable = true;
#    gamescope.capSysNice = true;
     ## permission issues with above:
     ## bwrap runs with root permissions and steam in userspace. 
     ## bwrap can't inherit this command option from steam afaik.
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
#      package = pkgs.steam.override { withJava = true; }; ## no worky :/
    };
    yazi.enable = true;
    yazi.settings.yazi.preview = [
      {
        "image_delay" = 500; 
        "image_filter" = "lanczos3";
      }
    ];
  };
}
