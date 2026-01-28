{ config, pkgs, ... }:

{
  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [
        # Brother printer drivers
        pkgs.brlaser
      ];
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Helps with frequency scaling for Intel CPU
    thermald.enable = true;

    # Enable Geo-location detection
    geoclue2.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  # For low latency audio
  security.rtkit.enable = true;

  # Needed so I dont type pw-jack every single time
  environment.etc."ld.so.conf.d/pipewire-jack.conf".text = "${pkgs.pipewire.jack}/lib";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Enable zram
  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 50;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      experimental = true; # show battery
      Privacy = "device";
      JustWorksRepairing = "always";
      Class = "0x000100";
      FastConnectable = true;
    };
  };

  # Enable document scanning
  hardware.sane = {
    enable = true;
    brscan5.enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

  # Dont need it since I use KDE Plasma
  # services.blueman.enable = true;
}
