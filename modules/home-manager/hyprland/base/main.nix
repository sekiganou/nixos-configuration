{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # Monitor configuration - Set per host in configuration.nix
      monitor = config.home-manager.hyprland.monitors;

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "MOZ_ENABLE_WAYLAND,1"
        "GDK_BACKEND,wayland,x11"
        # Fix for Electron apps (VS Code, Discord, etc.)
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        # Force proper scaling for applications
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        # Keyring integration
        "SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/keyring/ssh"
        "GNOME_KEYRING_CONTROL,$XDG_RUNTIME_DIR/keyring"
        # Enable proper secret service
        "DBUS_SESSION_BUS_ADDRESS,unix:path=$XDG_RUNTIME_DIR/bus"
      ];

      # Input configuration
      input = {
        kb_layout = config.home-manager.hyprland.kb_layout;
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          tap-to-click = true;
          middle_button_emulation = true;
        };
      };

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 4;
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = 10;
        active_opacity = 0.9;
        inactive_opacity = 0.8;

        # drop_shadow = true;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          # vibrancy = 0.1696;
        };
      };

      # Animation settings
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Layout settings
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # Misc settings
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # Window rules
      windowrulev2 = [
        # "opacity, opacity:0.5, class:.*"
        # "suppressevent maximize, class:.*"
        # "float,class:^(pavucontrol)$"
        # "float,class:^(thunar)$,title:^(File Operation Progress)$"
        "float, class:^(progr3\.mail\.client\.app\.MailClientApplication)$"
        "float, class:^(progr3\.mail\.server\.app\.MailServerApplication)$"
        # "nofocus, class:^(progr3\.mail\.client\.app\.MailClientApplication)$"
        # "nomaxsize, class:^(progr3\.mail\.client\.app\.MailClientApplication)$"
      ];
    };
  };
}
