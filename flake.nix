{
  description = "Flake for multiple machines";

  inputs = {
#   example of pinned revision for when unstable stream breaks.
#   nixpkgs.url = "github:nixos/nixpkgs?rev=b79ce4c43f9117b2912e7dbc68ccae4539259dda";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    catppuccin-vsc.url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";
  };
 
  outputs = { nixpkgs, home-manager, nixos-hardware, nix-colors, ... } @ inputs: 

  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};              
  in {
    nixosConfigurations = {     
      nixos-tp = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          {nixpkgs.overlays = [inputs.catppuccin-vsc.overlays.default];}
          ./configuration-thinkpad.nix
          home-manager.nixosModules.home-manager
          {home-manager.extraSpecialArgs = { inherit inputs;}; }
          {home-manager.users.James.imports = [ ];}
        ];
      };
    };
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        pkgs.gcc

        pkgs.bend

        pkgs.cargo
        pkgs.rustc
        pkgs.rustfmt
        pkgs.clippy
		
        (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
          numpy
          matplotlib
        ]))
      ];

      shellHook = ''
        PYTHONDONTWRITEBYTECODE=1
        echo STARTING CODIUM
        exec codium
      '';
    };
  }; 
}
