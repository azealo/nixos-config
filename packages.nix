{ config, pkgs, ... }: 

{

 environment.systemPackages = with pkgs; [
     # Development stuff
     curl
     wget
     git
     jdk
     pkg-config
     vscodium-fhs
     antigravity-fhs

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
     unrar

     # For Electric Guitar and Audio stuff
     pwvucontrol 
     qpwgraph    
     guitarix    
     reaper
     ardour
     wineWowPackages.staging 
     pipewire.jack
     wineasio
     yabridge
     yabridgectl             

     # Gaming and related stuff
     wine
     protonup-qt
     protonup-ng
     steam
     steam-run
     steam-unwrapped
     r2modman
     gamescope
     mangohud
     osu-lazer-bin
     prismlauncher
     bottles
     winetricks
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

  # Enable AppImage Support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;


}