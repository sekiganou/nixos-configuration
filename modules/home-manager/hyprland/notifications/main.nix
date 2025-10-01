{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Configure dunst for notifications - Caelestia style
    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = "(0, 400)";
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          frame_width = 2;
          frame_color = "#c2c1ff";  # Primary color
          font = "JetBrains Mono Nerd Font 10";
          corner_radius = 10;
          gap_size = 10;
          
          # Caelestia colors
          background = "#131317";
          foreground = "#e5e1e7";
        };

        urgency_low = {
          background = "#201f23";  # Surface container
          foreground = "#e5e1e7";  # On surface
          frame_color = "#918f9a";  # Outline
          timeout = 5;
        };

        urgency_normal = {
          background = "#201f23";
          foreground = "#e5e1e7";
          frame_color = "#c2c1ff";  # Primary
          timeout = 10;
        };

        urgency_critical = {
          background = "#93000a";  # Error container
          foreground = "#ffdad6";  # On error container
          frame_color = "#ffb4ab";  # Error
          timeout = 0;
        };
      };
    };
  };
}
