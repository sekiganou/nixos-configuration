{ config, lib, pkgs, ... }:
{
  services.xserver.enable = false;  # Using Wayland
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  
  services.printing.enable = true;  # Usually needed with desktop
}