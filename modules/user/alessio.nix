{ config, lib, pkgs, inputs, ... }:
{
  users.users.alessio = {
    isNormalUser = true;
    description = "Alessio Bagno";
    extraGroups = [ "networkmanager" "wheel" "docker" ];  # Added docker group
    packages = with pkgs; [
      kdePackages.kate
      nextcloud-client
    ];
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "alessio" = import ../../hosts/${config.networking.hostName}/home.nix;
    };
  };
}