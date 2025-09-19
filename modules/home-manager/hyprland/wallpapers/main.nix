{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Hyprpaper for wallpapers
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;
        
        preload = [
          "/home/alessio/Pictures/Wallpapers/hyprland.jpg"
          # "${pkgs.nixos-artwork.wallpapers.nineish-dark-gray}/share/backgrounds/nixos/nix-wallpaper-nineish-dark-gray.png"
        ];
        
        wallpaper = [
          "/home/alessio/Pictures/Wallpapers/hyprland.jpg"
          # ",${pkgs.nixos-artwork.wallpapers.nineish-dark-gray}/share/backgrounds/nixos/nix-wallpaper-nineish-dark-gray.png"
        ];
      };
    };
  };
}
