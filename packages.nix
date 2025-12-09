{ config, pkgs, ... }: 

{

 environment.systemPackages = with pkgs; [
     # Development stuff
     curl
     wget
     git
     jdk
     lshw
     android-studio
     flutter
     android-tools
     clang
     cmake
     ninja
     pkg-config
     vscodium-fhs

     # General programs
     micro
     fastfetch
     jetbrains-mono
     nerd-fonts.jetbrains-mono
     alacritty
     recordbox
     qbittorrent
     protonvpn-gui
     noisetorch
     lollypop
     intel-vaapi-driver
     intel-media-driver

     # Gaming and related stuff
     protonup-qt
     protonup-ng
     steam
     steam-run
     steam-unwrapped
     r2modman
     gamescope
     mangohud
     lutris 
     (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

  # Install firefox.
  programs.firefox.enable = true;

  programs.nix-ld.enable = true;

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
  
  nixpkgs.config = {
    # Accept Android SDK licenses
    android_sdk.accept_license = true;
  };

}