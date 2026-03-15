{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # KDE Packages
    kdePackages.kdenlive
    kdePackages.filelight

    # Development stuff
    curl
    wget
    git
    jdk
    pkg-config
    vscodium-fhs
    antigravity-fhs
    code-cursor-fhs
    opencode
    nixfmt

    # For Shell and Terminal
    micro
    fastfetch
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    meslo-lgs-nf
    alacritty
    btop
    fzf
    zsh-powerlevel10k
    zsh-history-substring-search
    waydroid-helper
    distrobox
    distroshelf
    podman

    # General programs
    recordbox
    qbittorrent
    protonvpn-gui
    noisetorch
    lollypop
    unrar
    nicotine-plus
    obsidian
    gimp
    wl-clipboard
    tauon
    libreoffice
    puddletag
    chromium
    handbrake
    audacity
    bleachbit

    # Required for Logitech Mouse keybindings
    logitech-udev-rules
    solaar

    # Intel Drivers
    intel-vaapi-driver
    intel-media-driver

    # Required for Nyrna
    xdotool
    wmctrl

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
    heroic
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

  # Required for Logitech Mouse keybindings
  hardware.logitech = {
    wireless.enable = true;
    wireless.enableGraphical = true;
  };

  # Enable Waydroid
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.nix-ld.enable = true;

  # Enable KDE Connect
  programs.kdeconnect.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = [
      # Install ProtonGE
      pkgs.proton-ge-bin
    ];
  };

  # Enable Feral Gamemode
  programs.gamemode.enable = true;

  # Enable Android Debug Bridge
  programs.adb.enable = true;

  # Enable AppImage Support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

}
