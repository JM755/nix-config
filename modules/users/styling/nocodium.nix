
{config, pkgs, ... }: {
  home-manager.users.James.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
       "window.titleBarStyle" = "custom";
       "usesOnlineServices" = "false";
       "mutableExtensionsDir" = "false";
       "workbench.colorTheme" = "Catppuccin Macchiato";       
      };
    extensions = [
      (pkgs.catppuccin-vsc.override {
        accent = "rosewater";
      })
      pkgs.vscode-extensions.jnoortheen.nix-ide
      pkgs.vscode-extensions.ms-python.python
    ];
  };
}

