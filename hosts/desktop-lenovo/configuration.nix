# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  system.dev.enable = true;
  system.hyprland.enable = true;
  system.plasma6.enable = true;
  system.tailscale.enable = true;

  networking.hostName = "desktop-lenovo"; # Define your hostname.

  # Configure Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      alessio = import ./home.nix;
    };
  };

  # Enable graphics drivers
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  nixpkgs.config.allowUnfree = true;
}
