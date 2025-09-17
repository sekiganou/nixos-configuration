{ config, lib, pkgs, ... }:
{
  virtualisation.docker.enable = true;
  
  environment.systemPackages = with pkgs; [
    git
    gnumake
  ];
  
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
}