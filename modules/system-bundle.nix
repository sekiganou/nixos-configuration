{ pkgs, lib, ... }: {
  imports = [
    ./system/audio.nix
    ./system/base.nix
    ./system/dev.nix
    ./system/hyprland.nix
    ./system/locale.nix
    ./system/plasma6.nix
    ./system/tailscale.nix
    ./system/user.nix
  ];

  system.locale.enable = lib.mkDefault true;
  system.audio.enable = lib.mkDefault true;
  system.base.enable = lib.mkDefault true;
  system.user.enable = lib.mkDefault true;
  system.dev.enable = lib.mkDefault true;
  system.hyprland.enable = lib.mkDefault true;
  system.plasma6.enable = lib.mkDefault true;
  system.tailscale.enable = lib.mkDefault true;
}