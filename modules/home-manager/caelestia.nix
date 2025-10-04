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
            explorer = "nautilus";
          };
          idle = {
            lockBeforeSleep = true;
            inhibitWhenAudio = true;
            timeouts = [
              {
                timeout = 9999;
                idleAction = "lock";
              }
              {
                timeout = 9999;
                idleAction = "dpms off";
                returnAction = "dpms on";
              }
              # {
              #   timeout = 600;
              #   idleAction = ["systemctl" "suspend-then-hibernate"];
              # }
            ];
          };
        };
        background = {
          desktopClock = {
            enabled = true;
          };
          enabled = true;
        };
        bar = {
          tray = {
            recolour = false;
            compact = true;
          };
        };
        paths.wallpaperDir = "~/Pictures/Wallpapers";
        services = {
          weatherLocation = "Asti,IT";
          defaultPlayer = "Feishin";
        };
        session = {
          enabled = true;
          commands = {
            logout = ["caelestia" "shell" "lock" "lock"];
            shutdown = ["systemctl" "poweroff"];
            hibernate = ["systemctl" "hibernate"];
            reboot = ["systemctl" "reboot"];
          };
        };
      };
      cli = {
        enable = true; # Also add caelestia-cli to path
        settings = {
          theme.enableGtk = true;
        };
      };
    };
  };
}
