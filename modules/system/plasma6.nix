{ config, lib, pkgs, ... }:
{
  options = {
    system.plasma6.enable = lib.mkEnableOption "Enable KDE Plasma 6 desktop environment";
  };
  config = lib.mkIf config.system.plasma6.enable {
  services.xserver.enable = false;  # Using Wayland
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  
  services.printing.enable = true;  # Usually needed with desktop
  };
}