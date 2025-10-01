# Caelestia Material Design 3 Color Scheme
# Based on https://github.com/caelestia-dots/caelestia/blob/main/hypr/scheme/default.conf
{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # Caelestia color scheme variables
      # These match the Material Design 3 color system used by Caelestia
      
      # Primary colors - purple/blue accent
      "$primary" = "c2c1ff";
      "$onPrimary" = "2a2a60";
      "$primaryContainer" = "7171ac";
      
      # Surface colors - dark theme backgrounds
      "$background" = "131317";
      "$surface" = "131317";
      "$surfaceContainer" = "201f23";
      "$surfaceContainerHigh" = "2a292e";
      "$surfaceContainerHighest" = "353438";
      
      # Text colors
      "$onBackground" = "e5e1e7";
      "$onSurface" = "e5e1e7";
      "$onSurfaceVariant" = "c8c5d1";
      
      # Border and outline colors
      "$outline" = "918f9a";
      "$outlineVariant" = "47464f";
    };
  };
}
