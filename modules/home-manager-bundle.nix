{ pkgs, lib, ... }: {
  imports = [
    ./home-manager/vscode.nix
    ./home-manager/hyprland/main.nix
    ./home-manager/dev-tools.nix
    ./home-manager/chromium.nix
    ./home-manager/nemo.nix
  ];

  # Set default values for home-manager modules
  home-manager.vscode.enable = lib.mkDefault true;
  home-manager.hyprland.enable = lib.mkDefault true;
  home-manager.dev-tools.enable = lib.mkDefault true;
  home-manager.chromium.enable = lib.mkDefault true;
  home-manager.nemo.enable = lib.mkDefault true;

  nixpkgs = {
    config.allowUnfree = true;
  };
}
