{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./home-manager/vscode.nix
    ./home-manager/hyprland/main.nix
    ./home-manager/dev-tools.nix
    ./home-manager/nemo.nix
    ./home-manager/discord.nix
    ./home-manager/feishin.nix
    ./home-manager/obsidian.nix
    ./home-manager/caelestia.nix
    ./home-manager/fastfetch.nix
    ./home-manager/neovim.nix
    ./home-manager/kodi.nix
    ./home-manager/wine-apps.nix
    inputs.caelestia-shell.homeManagerModules.default
  ];
  home.packages = with pkgs; [
    # jellyflix
    pomodoro-gtk
    direnv
    nix-direnv
    onlyoffice-desktopeditors
    gimp-with-plugins
    gnome-multi-writer
    libresprite
    ventoy
    gnome-text-editor
  ];
  # Set default values for home-manager modules
  home-manager.fastfetch.enable = lib.mkDefault true;
  home-manager.vscode.enable = lib.mkDefault true;
  home-manager.hyprland.enable = lib.mkDefault true;
  home-manager.dev-tools.enable = lib.mkDefault true;
  home-manager.nemo.enable = lib.mkDefault true;
  home-manager.discord.enable = lib.mkDefault true;
  home-manager.feishin.enable = lib.mkDefault true;
  home-manager.obsidian.enable = lib.mkDefault true;
  home-manager.caelestia.enable = lib.mkDefault true;
  home-manager.neovim.enable = lib.mkDefault true;
  home-manager.kodi.enable = lib.mkDefault true;
  home-manager.wine-apps.enable = lib.mkDefault true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "ventoy-1.1.07"
      ];
    };
  };
}
