{
  description = "onix home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, caelestia-shell, zen-browser, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."vaelixd" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          caelestia-shell.homeManagerModules.default
          zen-browser.homeModules.default
          ./home.nix

          {
           programs.caelestia.package = caelestia-shell.packages.${system}.default.overrideAttrs (old: {
             postInstall = (old.postInstall or "") + ''
               mkdir -p $out/lib/python3.13/site-packages/caelestia/data/schemes/
               cp -r ${./misc/caelestia/schemes}/* $out/lib/python3.13/site-packages/caelestia/data/schemes/
             '';
           });
          }
        ];
      };
    };
}
