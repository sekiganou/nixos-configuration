{
  config,
  pkgs,
  lib,
  ...
}: {
  xdg.desktopEntries = {
    # osu = {
    #   name = "osu!";
    #   comment = "Rhythm game";
    #   exec = "flatpak run sh.ppy.osu";
    #   icon = "osu";
    #   type = "Application";
    #   categories = ["Game"];
    # };
    youtube = {
      name = "YouTube";
      comment = "Watch YouTube videos";
      exec = "firefox -P youtube --kiosk https://www.youtube.com";
      icon = "/home/alessio/Nextcloud/Pictures/Icons/youtube.png";
      type = "Application";
      categories = ["Network"];
    };
    rufus = {
      name = "Rufus";
      comment = "Create bootable USB drives using Rufus";
      exec = "wine /home/alessio/Wine/rufus/rufus-4.11.exe";
      icon = "/home/alessio/Wine/rufus/icon.png";
      type = "Application";
      categories = ["Utility"];
    };
  };
}
