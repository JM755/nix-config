#overlay to change roll of hyprlock to patch hyprlock freezing with nvidia.
{ pkgs, ... }: 
{
  imports = [ ../home-manager/default.nix ];

  home-manager.users.Kryten.programs.hyprlock.package = pkgs.hyprlock.overrideAttrs 
  (finalAttrs: previousAttrs: {
    patchPhase = ''
      substituteInPlace src/core/hyprlock.cpp \
      --replace "5000" "16"
    '';
  });
}

