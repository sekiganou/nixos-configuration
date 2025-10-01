{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Essential packages for Hyprland with Caelestia theme
    home.packages = with pkgs; [
      # Terminal (Caelestia uses Foot, but we keep Kitty as backup)
      foot
      kitty
      fish
      starship

      # Application launcher (Caelestia uses Fuzzel instead of Rofi)
      fuzzel
      rofi # Keep as backup

      # File manager (keeping your choice)
      nemo
      gvfs

      # Appearance tools
      lxappearance
      adwaita-icon-theme
      papirus-icon-theme

      # Status bar - We'll need to add Quickshell later
      # For now, keep waybar as it's already configured
      waybar

      # Notification daemon
      dunst

      # Wallpaper
      hyprpaper

      # Audio control
      pavucontrol
      playerctl
      wireplumber # Caelestia dependency

      # Screenshots (Caelestia uses these)
      grim
      slurp
      wl-clipboard
      swappy # Screenshot editor

      # Clipboard management (Caelestia uses cliphist)
      cliphist

      # Network manager applet
      networkmanagerapplet

      # Bluetooth manager
      blueman

      # Color picker
      hyprpicker

      # Night mode / Blue light filter (Caelestia uses gammastep)
      gammastep
      geoclue2 # Location provider for gammastep

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

      # System utilities
      wlogout
      trash-cli # Caelestia uses trash-cli for safe file deletion

      # Shell utilities (Caelestia dependencies)
      eza # Modern ls replacement (aliased in fish config)
      fastfetch # System info (Caelestia uses this instead of neofetch)
      jq # JSON processor
      inotify-tools # File monitoring

      # Fonts (Caelestia requirements)
      material-symbols # Material Design icons
      # (nerdfonts.override {fonts = ["JetBrainsMono" "CascadiaCode"];})
    ];
  };
}
