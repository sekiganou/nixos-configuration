{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.caelestia.enable = lib.mkEnableOption "Enable Caelestia Theme";
  };

  config = lib.mkIf config.home-manager.caelestia.enable {
    programs.caelestia = {
      enable = true;
      systemd = {
        enable = false; # if you prefer starting from your compositor
        target = "graphical-session.target";
        environment = [];
      };
      settings = {
        bar.status = {
          showBattery = false;
        };
        paths.wallpaperDir = "~/Pictures/Wallpapers";
      };
      cli = {
        enable = true; # Also add caelestia-cli to path
        settings = {
          theme.enableGtk = false;
        };
      };
    };
  };
}
