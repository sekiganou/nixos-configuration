{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Essential packages for Hyprland
    home.packages = with pkgs; [
      # Terminal
      kitty
      zsh
      zsh-autosuggestions

      # Application launcher
      rofi

      # File manager
      #nautilus
      #lf
      nemo
      gvfs
      lxappearance
      adwaita-icon-theme
      papirus-icon-theme

      # Status bar
      waybar
      python3Packages.pywal

      # Notification daemon
      dunst

      # Wallpaper
      hyprpaper

      # Audio control
      pavucontrol
      playerctl

      # Screenshots
      grim
      slurp
      wl-clipboard

      # Network manager applet
      networkmanagerapplet

      # Bluetooth manager
      blueman

      # Color picker
      hyprpicker

      # Night mode / Blue light filter
      gammastep

      # System monitor
      btop

      # PDF viewer
      zathura

      # Image viewer
      imv

      # Video player
      mpv

      # Keyring and authentication
      gnome-keyring
      polkit_gnome
      libsecret

      wlogout
    ];
  };
}
