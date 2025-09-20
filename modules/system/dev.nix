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
      jetbrains.idea-ultimate
      jdk21_headless
      scenebuilder
      javaPackages.openjfx23
    ];
    
    programs.firefox.enable = true;

    nixpkgs = {
      config.allowUnfree = true;
    };
  };


}