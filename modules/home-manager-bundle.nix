{ pkgs, lib, ... }: {
  imports = [
    ./home-manager/vscode.nix
#    ./home-manager/hyprland.nix
  ];

#  home-manager.vscode.enable = lib.mkDefault true;

  nixpkgs = {
    config.allowUnfree = true;
  };
}
