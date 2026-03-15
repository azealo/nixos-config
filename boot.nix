{ config, pkgs, ... }:

{
  boot = {
    # Bootloader
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Use the XanMod latest kernel
    kernelPackages = pkgs.linuxPackages_6_12;

    # Enable Plymouth Boot Animation
    plymouth = {
      enable = true;
      theme = "bgrt";
      # themePackages = with pkgs; [
      #   # By default we would install all themes
      #   (adi1090x-plymouth-themes.override {
      #     selected_themes = [ "rings" ];
      #   })
      # ];
    };

    # Adjustments for zram
    kernel.sysctl = {
      "vm.swappiness" = 180; # High value is good for zRAM (max is 200)
      "vm.watermark_boost_factor" = 0; # Reduces stuttering when memory is tight
      "vm.watermark_scale_factor" = 125;
      "vm.page-cluster" = 0;
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

  };
}
