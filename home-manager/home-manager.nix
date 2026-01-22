{ config, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.sharedModules = [ <plasma-manager/modules> ];

  home-manager.users.azealo =
    { pkgs, ... }:
    {
      imports = [ ./plasma.nix ];

      home.stateVersion = "25.11";
    };
}
