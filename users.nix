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
      "dialout"
      "tty"
    ];
    packages = with pkgs; [
    ];
  };
}
