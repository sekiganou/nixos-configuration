{ config, lib, pkgs, ... }:
{
  options = {
    system.base.enable = lib.mkEnableOption "Enable base system configuration";
  };

  config = lib.mkIf config.system.base.enable {
    boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.networkmanager.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.05";
  };
}