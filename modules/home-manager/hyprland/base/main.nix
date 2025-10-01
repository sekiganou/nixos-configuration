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

      # General settings - Caelestia style
      general = {
        gaps_in = 10;
        gaps_out = 40;
        border_size = 3;
        "col.active_border" = "rgba(c2c1ffe6)";  # Primary color with opacity
        "col.inactive_border" = "rgba(47464f11)";  # Outline variant with low opacity
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings - Caelestia style with Material Design 3 aesthetics
      decoration = {
        rounding = 10;  # Caelestia uses 10px rounding
        active_opacity = 0.95;  # Slight transparency for active windows
        inactive_opacity = 0.95;

        # Shadows for depth
        drop_shadow = true;
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(131317d4)";  # Dark shadow based on background color

        blur = {
          enabled = true;
          size = 8;  # Caelestia uses size 8
          passes = 2;  # Caelestia uses 2 passes
          vibrancy = 0.1696;
          ignore_opacity = true;
          new_optimizations = true;
          xray = false;
          popups = true;
        };
      };

      # Animation settings - Caelestia uses Material Design 3 motion curves
      animations = {
        enabled = true;
        # Animation curves from Caelestia
        bezier = [
          "specialWorkSwitch, 0.05, 0.7, 0.1, 1"
          "emphasizedAccel, 0.3, 0, 0.8, 0.15"
          "emphasizedDecel, 0.05, 0.7, 0.1, 1"
          "standard, 0.2, 0, 0, 1"
        ];
        animation = [
          "layersIn, 1, 5, emphasizedDecel, slide"
          "layersOut, 1, 4, emphasizedAccel, slide"
          "fadeLayers, 1, 5, standard"
          "windowsIn, 1, 5, emphasizedDecel"
          "windowsOut, 1, 3, emphasizedAccel"
          "windowsMove, 1, 6, standard"
          "workspaces, 1, 5, standard"
          "specialWorkspace, 1, 4, specialWorkSwitch, slidefadevert 15%"
          "fade, 1, 6, standard"
          "fadeDim, 1, 6, standard"
          "border, 1, 6, standard"
        ];
      };

      # Layout settings
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = false;
        smart_resizing = true;
      };

      master = {
        new_status = "master";
      };

      # Window group styling (Caelestia)
      group = {
        "col.border_active" = "rgba(c2c1ffe6)";
        "col.border_inactive" = "rgba(47464f11)";
        "col.border_locked_active" = "rgba(c2c1ffe6)";
        "col.border_locked_inactive" = "rgba(47464f11)";
        
        groupbar = {
          font_family = "JetBrains Mono Nerd Font";
          font_size = 10;
          text_color = "rgba(e5e1e7ff)";
          "col.active" = "rgba(c2c1ffe6)";
          "col.inactive" = "rgba(47464faa)";
        };
      };

      # Misc settings - Caelestia configuration
      misc = {
        force_default_wallpaper = 0;  # Disable Hyprland logo
        disable_hyprland_logo = true;
        vfr = true;
        vrr = 1;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
        focus_on_activate = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        background_color = "rgb(201f23)";  # Surface container color
      };

      # Window rules - Caelestia style
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        # Opacity rules
        "opacity 0.95 override, fullscreen:0"
        # Float common dialogs
        "float,class:^(pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(thunar)$,title:^(File Operation Progress)$"
        "float,title:(Select|Open)( a)? (File|Folder)(s)?"
        "float,title:File (Operation|Upload)( Progress)?"
        # Center floating windows (not xwayland to avoid popup issues)
        "center 1, floating:1, xwayland:0"
        # Picture in picture
        "float, title:Picture(-| )in(-| )[Pp]icture"
        "pin, title:Picture(-| )in(-| )[Pp]icture"
        "keepaspectratio, title:Picture(-| )in(-| )[Pp]icture"
      ];

      # Workspace rules - Caelestia single window gap optimization
      workspace = [
        "w[tv1]s[false], gapsout:20"  # Single window on workspace gets smaller gaps
        "f[1]s[false], gapsout:20"  # Single window fullscreen gets smaller gaps
      ];
    };
  };
}
