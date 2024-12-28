{ pkgs, config, ... }:
{
  imports = [];
  boot = {

    plymouth = {
      enable = true;
      theme = "red_loader";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "red_loader" ];
        })
      ];
    };
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


#    initrd.verbose = false; 
#    consoleLogLevel = 0;
#    kernelParams = [ 
#      "quiet"
#      "splash" 
#      "udev.log_level=3" 
#      "loglevel=3" 
#      "rd.systemd.show_status=false" 
#      "rd.udev.log_level=3"
#      "udev.log_priority=3"
#    ];
#    kernelPatches = { 
#      name = "foo"; 
#      patch = ./foo.patch; #can be null if only config changes are applied
#      extraStructuredConfig = {
#        FOO = lib.kernel.yes; #look this up idk. optional apparently
#      };
#      features = {
#        foo = true;
#      };
#      extraConfig = "FOO y";
#    };    

#    tmp.useTmpfs = true;
#    tmp.tmpfsSize = "99%";  
 ## Should speed up rebuild eval time and other conservations.
 ## Causes /tmp to mount to memory. 2nd line allocates more space to tmp for large builds.

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
