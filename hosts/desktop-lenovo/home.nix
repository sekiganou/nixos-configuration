{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alessio";
  home.homeDirectory = "/home/alessio";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
  };

  imports = [
    ../../modules/home-manager-bundle.nix
    # inputs.caelestia-shell.homeManagerModules.default
  ];

  home-manager.hyprland.monitors = [
    "DP-1,1920x1080@143.85,0x0,1" # MSI G24C4 144Hz monitor
    # "HDMI-A-1,1920x1080@60,1920x0,1"   # Secondary monitor (uncomment if needed)
    ",preferred,auto,auto" # Auto-configure other monitors
  ];

  home-manager.hyprland.kb_layout = "us";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
