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
      "cdrom"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
