{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.home-manager.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # Auto-start applications
      exec-once = [
        "gammastep -O 4000" # Start gammastep with night mode
        "waybar"
        "dunst"
        "hyprpaper"
        "nm-applet --indicator"
        "blueman-applet"
        # Start polkit authentication agent
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        # Start GNOME Keyring daemon
        "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh"
      ];
    };

    # Enable GNOME Keyring for password storage
    services.gnome-keyring = {
      enable = true;
      components = [ "pkcs11" "secrets" "ssh" ];
    };
  };
}
