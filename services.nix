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

    # Enable fwupd daemon to update firmwares
    fwupd.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      extraConfig.pipewire = {
        "10-null-sink" = {
          "context.objects" = [
            {
              factory = "adapter";
              args = {
                "factory.name" = "support.null-audio-sink";
                "node.name" = "audiorelay-virtual-mic-sink";
                "node.description" = "Virtual Mic Sink";
                "media.class" = "Audio/Sink";
                "audio.position" = "FL,FR";
              };
            }
          ];
        };
        "20-virtual-mic" = {
          "context.modules" = [
            {
              name = "libpipewire-module-loopback";
              args = {
                "capture.props" = {
                  "node.target" = "audiorelay-virtual-mic-sink";
                };
                "playback.props" = {
                  "node.name" = "audiorelay-virtual-mic";
                  "node.description" = "Virtual Mic";
                  "media.class" = "Audio/Source";
                  "audio.position" = "FL,FR";
                  "node.passive" = true;
                };
              };
            }
          ];
        };
      };
    };

    udev.packages = [ pkgs.platformio-core.udev ];
    udev.extraRules = ''
      # Standard Arduino / Common USB-Serial
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", MODE="0666"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", MODE="0666"
    '';

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

  # Enable Podman Container Engine
  virtualisation.podman.enable = true;

  # Dont need it since I use KDE Plasma
  # services.blueman.enable = true;
}
