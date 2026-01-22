{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    shortcuts = {

      kwin."Window Close" = [
        "Meta+Q"
        "Alt+F4"
      ];
      kwin."Window Fullscreen" = "Meta+F";
      "services/Alacritty.desktop"._launch = "Meta+Return";
      "services/app.zen_browser.zen.desktop"._launch = "Meta+W";
      "services/org.kde.krunner.desktop"._launch = [
        "Meta+D"
        "Search"
        "Alt+F2"
        "Alt+Space"
      ];

    };
    configFile = {
      kcminputrc.Mouse.cursorSize = 32;
      kcminputrc.Mouse.cursorTheme = "Posy_Cursor_Black";
      kdeglobals.WM.activeBackground = "39,44,49";
      kdeglobals.WM.activeBlend = "252,252,252";
      kdeglobals.WM.activeForeground = "252,252,252";
      kdeglobals.WM.inactiveBackground = "32,36,40";
      kdeglobals.WM.inactiveBlend = "161,169,177";
      kdeglobals.WM.inactiveForeground = "161,169,177";
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".Image =
        "../assets/wallpaper/innerspeaker-wide.jpg";
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".PreviewImage =
        "../assets/wallpaper/innerspeaker-wide.jpg";
      ksmserverrc.General.loginMode = "emptySession";
      ksplashrc.KSplash.Engine = "none";
      ksplashrc.KSplash.Theme = "None";
      kwinrc.Xwayland.Scale = 1;
      kwinrc."org.kde.kdecoration2".theme = "__aurorae__svg__Utterly-Round-Dark";
      plasma-localerc.Formats.LANG = "tr_TR.UTF-8";
      plasmanotifyrc."Applications/com.rtosta.zapzap".Seen = true;
      plasmanotifyrc."Applications/com.usebottles.bottles".Seen = true;
      plasmanotifyrc."Applications/discord".Seen = true;
      plasmarc.Wallpapers.usersWallpapers = "../assets/wallpaper/innerspeaker-wide.jpg";
    };
  };
}
