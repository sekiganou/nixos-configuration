{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Set kitty as default terminal using dconf
    # dconf.settings = {
    #   "org/gnome/desktop/default-applications/terminal" = {
    #     exec = "kitty";
    #     exec-arg = "-e";
    #   };
    # };

    wayland.windowManager.hyprland.settings = {
      # Auto-start applications - Caelestia style
      exec-once = [
        # Keyring and authentication
        "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        
        # Status bar and notifications
        "waybar"
        "dunst"
        
        # Wallpaper
        "hyprpaper"
        
        # System tray apps
        "nm-applet --indicator"
        "blueman-applet"
        
        # Clipboard history
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        
        # Location provider and night light
        "/usr/lib/geoclue-2.0/demos/agent"
        "sleep 1 && gammastep"
        
        # Auto delete old trash (30 days)
        "trash-empty 30"
        
        # Cursor theme
        "hyprctl setcursor Adwaita 24"
      ];
    };

    # Enable GNOME Keyring for password storage
    services.gnome-keyring = {
      enable = true;
      components = ["pkcs11" "secrets" "ssh"];
    };
  };
}
