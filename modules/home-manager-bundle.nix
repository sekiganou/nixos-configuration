{ pkgs, lib, ... }: {
  imports = [
    ./home-manager/vscode.nix
    ./home-manager/hyprland.nix
    ./home-manager/dev-tools.nix
  ];

  # Set default values for home-manager modules
  home-manager.vscode.enable = lib.mkDefault true;
  home-manager.hyprland.enable = lib.mkDefault false;
  home-manager.dev-tools.enable = lib.mkDefault true;

  nixpkgs = {
    config.allowUnfree = true;
  };
}
