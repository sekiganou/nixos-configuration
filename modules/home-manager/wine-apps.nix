{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.wine-apps.enable = lib.mkEnableOption "Enable Wine applications";
  };

  config = lib.mkIf config.home-manager.wine-apps.enable {
    home.packages = with pkgs; [
      wineWowPackages.stable
      winetricks
    ];

    xdg.desktopEntries = {
      rufus = {
        name = "Rufus";
        comment = "Create bootable USB drives using Rufus";
        exec = "wine /home/alessio/Wine/rufus/rufus-4.11.exe";
        icon = "/home/alessio/Wine/rufus/icon.png";
        type = "Application";
        categories = ["Utility"];
      };
    };
  };
}
