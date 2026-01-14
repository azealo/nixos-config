{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Pinned nixpkgs for Prism 9.4
    nixpkgs-prism.url = "github:NixOS/nixpkgs/eeba9971860b0b97c5d95f209e876327c777fee4";
  };

  outputs = { self, nixpkgs, nixpkgs-prism, ... }:
  let
    system = "x86_64-linux"; 
    pkgs-prism = import nixpkgs-prism { inherit system; config.allowUnfree = true; };
  in {
    nixosConfigurations.azealo = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        {
          environment.systemPackages = [
            pkgs-prism.prismlauncher
          ];
        }
      ];
    };
  };
}