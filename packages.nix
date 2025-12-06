{ config, pkgs, ... }: 

{

 environment.systemPackages = with pkgs; [
     curl
     wget
     git
     lshw
     lollypop
     micro
     protonup-qt
     fastfetch
     android-studio
     protonvpn-gui
     vscodium-fhs
     lollypop
     steam
     steam-run
     steam-unwrapped
     r2modman
     gamescope
     jetbrains-mono
     nerd-fonts.jetbrains-mono
     mangohud
     alacritty
     recordbox
     lutris
     qbittorrent
     intel-vaapi-driver
     intel-media-driver 
     (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

  # Install firefox.
  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Enable Feral Gamemode
  programs.gamemode.enable = true;
   
  # Enable Android Debug Bridge
  programs.adb.enable = true;

  # Enable AppImage
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

}