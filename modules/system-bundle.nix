{ pkgs, lib, ... }: {
  imports = [
    ./system/audio.nix
    ./system/base.nix
    ./system/dev.nix
    ./system/locale.nix
    ./system/plasma6.nix
    ./system/tailscale.nix
    ./system/user.nix
  ];

  system.audio.enable = lib.mkDefault true;
  system.base.enable = lib.mkDefault true;
  system.user.enable = lib.mkDefault true;
}