{ config, lib, pkgs, ... }:
{
  options = {
    system.dev.enable = lib.mkEnableOption "Enable development environment";
  };

  config = lib.mkIf config.system.dev.enable {
  virtualisation.docker.enable = true;
  
  environment.systemPackages = with pkgs; [
    git
    gnumake
  ];
  
  programs.firefox.enable = true;
  };
}