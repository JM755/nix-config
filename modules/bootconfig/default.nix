{ pkgs, config, ... }:
{
  imports = [];
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.enable = true;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      timeout = 5;
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        gfxmodeEfi = "auto";
        configurationLimit = 12;
        #entryOptions = "";
        #extraConfig = "";
        #extraEntries = "";
        #extraEntriesBeforeNixOS = false;
        #extraPerEntryConfig = "";
        #extraPrepareConfig = "";
        #subEntryOptions = "";
        #theme = "";
        #timeoutStyle = "";      
      };
    };
  };
}
