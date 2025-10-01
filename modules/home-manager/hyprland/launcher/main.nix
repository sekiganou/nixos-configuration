# Fuzzel launcher configuration - Caelestia style
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Configure Fuzzel launcher (Caelestia uses Fuzzel instead of Rofi)
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "foot";
          layer = "overlay";
          width = 40;
          horizontal-pad = 20;
          vertical-pad = 10;
          inner-pad = 10;
          line-height = 25;
          letter-spacing = 0;
          
          # Caelestia font
          font = "JetBrains Mono Nerd Font:size=12";
          icon-theme = "Papirus-Dark";
          show-actions = true;
        };

        colors = {
          # Caelestia Material Design 3 colors
          background = "131317e6";  # Background with opacity
          text = "e5e1e7ff";  # On surface
          match = "c2c1ffff";  # Primary
          selection = "353438ff";  # Surface container highest
          selection-text = "e5e1e7ff";  # On surface
          selection-match = "c2c1ffff";  # Primary
          border = "c2c1ffe6";  # Primary with opacity
        };

        border = {
          width = 2;
          radius = 10;
        };
      };
    };
  };
}
