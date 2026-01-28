{ config, pkgs, ... }:

{
  users.users.azealo = {
    isNormalUser = true;
    description = "Azealo";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
      "kvm"
      "scanner"
      "lp"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
