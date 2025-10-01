{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # Main modifier key - Caelestia uses Super (Windows key)
      "$mainMod" = "SUPER";

      # Keybindings - Caelestia style
      bind = [
        # Application shortcuts (keeping your existing apps)
        "$mainMod, T, exec, foot"  # Terminal - now using Foot
        "$mainMod, W, exec, firefox"  # Browser
        "$mainMod, C, exec, code"  # IDE/Editor
        "$mainMod, E, exec, nemo"  # File manager
        
        # Window management
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod ALT, F, fullscreen, 1"  # Bordered fullscreen
        "$mainMod, P, pin,"  # Pin window
        "$mainMod, U, togglegroup,"  # Ungroup/toggle group
        "$mainMod, Comma, changegroupactive,"
        
        # Launcher - will use fuzzel
        "$mainMod, space, exec, fuzzel"
        "$mainMod, R, exec, fuzzel"  # Alternative launcher binding
        
        # Special/Scratchpad workspaces
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        
        # System shortcuts
        "SUPER, Escape, exec, wlogout"
        "CTRL ALT, Delete, exec, wlogout"  # Session menu
        "CTRL SHIFT, Escape, exec, foot btop"  # System monitor

        # Screenshot
        ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
        "CTRL, Print, exec, grim - | swappy -f -"  # Full screen
        
        # Color picker
        "$mainMod SHIFT, C, exec, hyprpicker -a"
        
        # Clipboard history
        "$mainMod, Period, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move focus with mainMod + hjkl (vim style)
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Move windows with mainMod + SHIFT + hjkl
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Resize windows with mainMod + X + hjkl
        "$mainMod, Z, submap, move"  # Move mode
        "$mainMod, X, submap, resize"  # Resize mode

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to workspace with mainMod + ALT + [0-9]
        "$mainMod ALT, 1, movetoworkspace, 1"
        "$mainMod ALT, 2, movetoworkspace, 2"
        "$mainMod ALT, 3, movetoworkspace, 3"
        "$mainMod ALT, 4, movetoworkspace, 4"
        "$mainMod ALT, 5, movetoworkspace, 5"
        "$mainMod ALT, 6, movetoworkspace, 6"
        "$mainMod ALT, 7, movetoworkspace, 7"
        "$mainMod ALT, 8, movetoworkspace, 8"
        "$mainMod ALT, 9, movetoworkspace, 9"
        "$mainMod ALT, 0, movetoworkspace, 10"

        # Navigate workspaces
        "CTRL $mainMod, right, workspace, e+1"
        "CTRL $mainMod, left, workspace, e-1"

        # Window group cycling (like Alt+Tab)
        "ALT, Tab, changegroupactive, f"
        "SHIFT ALT, Tab, changegroupactive, b"

        # Media keys
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mainMod SHIFT, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
        "CTRL $mainMod, Space, exec, playerctl play-pause"  # Toggle media

        # Brightness keys
        ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"

        # Sleep/Lock
        "$mainMod SHIFT, L, exec, systemctl suspend-then-hibernate"
      ];

      # Submaps for resize and move modes
      submap = [
        # Resize mode
        "resize"
        "binde=, h, resizeactive, -10 0"
        "binde=, l, resizeactive, 10 0"
        "binde=, k, resizeactive, 0 -10"
        "binde=, j, resizeactive, 0 10"
        "bind=, escape, submap, reset"
        "submap=reset"
        
        # Move mode  
        "move"
        "binde=, h, moveactive, -10 0"
        "binde=, l, moveactive, 10 0"
        "binde=, k, moveactive, 0 -10"
        "binde=, j, moveactive, 0 10"
        "bind=, escape, submap, reset"
        "submap=reset"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
