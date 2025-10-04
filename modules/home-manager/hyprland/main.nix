{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./apps.nix
    ./base/main.nix
    ./keybindings/main.nix
    ./autostart/main.nix
    ./terminal/main.nix
    ./wallpapers/main.nix
  ];

  options = {
    home-manager.hyprland = {
      enable = lib.mkEnableOption "Enable Hyprland with necessary packages and configurations";
      monitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [",preferred,auto,auto"];
        description = "Monitor configuration strings for Hyprland";
        example = ["DP-1,1920x1080@144,0x0,1" "HDMI-A-1,1920x1080@60,1920x0,1"];
      };
      kb_layout = lib.mkOption {
        type = lib.types.str;
        default = "us";
        description = "Default keyboard layout for Hyprland (e.g., 'us', 'fr', 'de')";
      };
    };
  };

  config = lib.mkIf config.home-manager.hyprland.enable {
    # Enable Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };

    # Configure gammastep for automatic night mode (commented out as per original)
    # services.gammastep = {
    #   enable = true;
    # provider = "manual";
    # latitude = 45.0; # Adjust to your location
    # longitude = 9.0; # Adjust to your location
    # settings = {
    #   general = {
    #     temp-day = 6500;
    #     temp-night = 4000;
    #     brightness-day = 1.0;
    #     brightness-night = 0.8;
    #     gamma = 1.0;
    #     adjustment-method = "wayland";
    #     fade = 1;
    #   };
    # };
    # };
  };
}
