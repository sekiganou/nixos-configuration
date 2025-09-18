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
  system.locale.enable = true;
  system.plasma6.enable = true;
  system.tailscale.enable = true;

  networking.hostName = "laptop-asus"; # Define your hostname.

  # nixpkgs.config.allowUnfree = true;
}
