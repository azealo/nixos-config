{ config, pkgs, ... }:

{
  users.users.azealo = {
    isNormalUser = true;
    description = "Azealo";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "kvm"];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };
}
