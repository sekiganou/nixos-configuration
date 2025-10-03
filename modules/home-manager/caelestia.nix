{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.caelestia = {
      enable = lib.mkEnableOption "Enable Caelestia Theme";
    };
  };

  config = lib.mkIf config.home-manager.caelestia.enable {
    programs.caelestia = {
      enable = true;
      systemd = {
        enable = true; # if you prefer starting from your compositor
        target = "graphical-session.target";
        environment = [];
      };
      settings = {
        bar.status = {
          showBattery = true;
        };
        general = {
          apps = {
            terminal = "kitty";
            # explorer = "nemo";
          };
          idle = {
            lockBeforeSleep = true;
            inhibitWhenAudio = true;
            timeouts = [
              {
                timeout = 180;
                idleAction = "lock";
              }
              {
                timeout = 300;
                idleAction = "dpms off";
                returnAction = "dpms on";
              }
              {
                timeout = 600;
                idleAction = ["systemctl" "suspend-then-hibernate"];
              }
            ];
          };
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
