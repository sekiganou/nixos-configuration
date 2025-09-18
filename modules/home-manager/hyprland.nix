{ config, lib, pkgs, inputs, ... }:
{
  options = {
    home-manager.hyprland.enable = lib.mkEnableOption "Enable Hyprland with necessary packages and configurations";
  };

  config = lib.mkIf config.home-manager.hyprland.enable {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };};
}