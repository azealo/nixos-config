{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Firewall Settings
  networking.firewall = {
    enable = true;

    # Waydroid Fix For Zapret DPI
    trustedInterfaces = [ "waydroid0" ];
    checkReversePath = "loose";

    # Open ports for Soulseek/Nicotine+
    allowedTCPPorts = [
      2234
      2235
    ];
    allowedUDPPorts = [
      2234
      2235
    ];
  };

  # Zapret DPI Bypass

  networking = {
    hostName = "nixos";
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      listen_addresses = [
        "127.0.0.1:53"
        "[::1]:53"
      ];
    };
  };

  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=fake"
      "--dpi-desync-ttl=8"
    ];
  };

}
