{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # Main modifier key - User prefers ALT instead of Super
      "$mainMod" = "ALT";

      # Keybindings - Preserving existing user bindings and adding Caelestia enhancements
      bind = [
        # Application shortcuts (existing user bindings preserved)
        "$mainMod, C, exec, code"  # Open VSCode (changed from neofetch)
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nemo"
        "$mainMod, V, togglefloating,"
        "$mainMod, space, exec, fuzzel"  # Using Fuzzel launcher
        "$mainMod, P, pseudo,"
        "$mainMod, F, exec, firefox"
        "$mainMod, N, exec, code ~/nixos-configuration"
        "$mainMod, T, exec, foot"  # New: Terminal with Foot
        "$mainMod, W, exec, firefox"  # New: Browser (alternative binding)
        
        # System shortcuts (existing)
        "SUPER, Escape, exec, wlogout"
        "CTRL SHIFT, Escape, exec, foot btop"  # System monitor with Foot
        "CTRL ALT, Delete, exec, wlogout"  # Session menu

        # Window management (new Caelestia features)
        "$mainMod SHIFT, F, fullscreen, 1"  # Bordered fullscreen
        "$mainMod CTRL, P, pin,"  # Pin window
        "$mainMod, U, togglegroup,"  # Toggle window group
        "$mainMod, Comma, changegroupactive,"  # Change active in group
        "$mainMod SHIFT, Comma, lockactivegroup, toggle"  # Lock group
        "$mainMod CTRL, U, moveoutofgroup,"  # Ungroup window

        # Screenshot (existing + enhanced)
        "$mainMod, S, exec, grim -g \"$(slurp)\" - | swappy -f -"  # Region with annotation
        ", Print, exec, grim - | wl-copy"  # Full screen to clipboard
        "CTRL, Print, exec, grim - | swappy -f -"  # Full screen with annotation
        "SHIFT, Print, exec, grim -g \"$(slurp)\" - | wl-copy"  # Region to clipboard
        
        # New: Color picker (Caelestia)
        "$mainMod SHIFT, C, exec, hyprpicker -a"
        
        # New: Clipboard history (Caelestia feature)
        "$mainMod SHIFT, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
        "SUPER, Period, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"  # Alternative binding
        
        # New: Emoji picker (Caelestia feature)
        "SUPER SHIFT, Period, exec, fuzzel --dmenu < ~/.local/share/emoji.txt | wl-copy"  # If emoji file exists

        # Move focus with mainMod + arrow keys (existing)
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move focus with mainMod + hjkl (existing)
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Move windows with mainMod + SHIFT + hjkl (existing)
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Move windows with mainMod + SHIFT + arrows (Caelestia addition)
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # New: Resize windows (Caelestia feature)
        "$mainMod, Z, submap, move"  # Move mode
        "$mainMod, X, submap, resize"  # Resize mode
        "$mainMod CTRL, equal, splitratio, 0.1"  # Increase split ratio
        "$mainMod CTRL, minus, splitratio, -0.1"  # Decrease split ratio

        # New: Center window (Caelestia feature)
        "$mainMod CTRL, C, centerwindow, 1"

        # Switch workspaces with mainMod + [0-9] (existing)
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

        # Move active window to workspace (existing)
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Navigate workspaces (new Caelestia additions)
        "$mainMod CTRL, right, workspace, e+1"
        "$mainMod CTRL, left, workspace, e-1"
        "$mainMod, Page_Down, workspace, e+1"
        "$mainMod, Page_Up, workspace, e-1"

        # Move window to adjacent workspace (Caelestia feature)
        "$mainMod CTRL SHIFT, right, movetoworkspace, e+1"
        "$mainMod CTRL SHIFT, left, movetoworkspace, e-1"
        "$mainMod SHIFT, Page_Down, movetoworkspace, e+1"
        "$mainMod SHIFT, Page_Up, movetoworkspace, e-1"

        # Special workspace (scratchpad) (existing)
        "$mainMod, grave, togglespecialworkspace, magic"
        "$mainMod SHIFT, grave, movetoworkspace, special:magic"
        
        # New: Additional special workspace control (Caelestia)
        "$mainMod, S, togglespecialworkspace, magic"  # Alternative toggle
        "$mainMod CTRL SHIFT, up, movetoworkspace, special:magic"
        "$mainMod CTRL SHIFT, down, movetoworkspace, e+0"  # Move from special to current

        # Scroll through existing workspaces with mainMod + scroll (existing)
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Window group cycling (new Caelestia feature)
        "ALT, Tab, changegroupactive, f"  # Cycle forward in group
        "SHIFT ALT, Tab, changegroupactive, b"  # Cycle backward in group
        "CTRL ALT, Tab, cyclenext"  # Cycle to next window
        "CTRL SHIFT ALT, Tab, cyclenext, prev"  # Cycle to previous window

        # Media keys (existing + enhanced with wpctl)
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mainMod SHIFT, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
        "CTRL SUPER, Space, exec, playerctl play-pause"  # Caelestia media toggle

        # Brightness keys (existing)
        ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"

        # New: Sleep/Lock (Caelestia feature)
        "$mainMod SHIFT, L, exec, systemctl suspend-then-hibernate"
        "SUPER SHIFT, L, exec, systemctl suspend-then-hibernate"  # Alternative binding
      ];

      # Submaps for resize and move modes (Caelestia feature)
      submap = [
        # Resize mode
        "resize"
        "binde=, h, resizeactive, -10 0"
        "binde=, l, resizeactive, 10 0"
        "binde=, k, resizeactive, 0 -10"
        "binde=, j, resizeactive, 0 10"
        "binde=, left, resizeactive, -10 0"
        "binde=, right, resizeactive, 10 0"
        "binde=, up, resizeactive, 0 -10"
        "binde=, down, resizeactive, 0 10"
        "bind=, escape, submap, reset"
        "bind=, return, submap, reset"
        "submap=reset"
        
        # Move mode  
        "move"
        "binde=, h, moveactive, -10 0"
        "binde=, l, moveactive, 10 0"
        "binde=, k, moveactive, 0 -10"
        "binde=, j, moveactive, 0 10"
        "binde=, left, moveactive, -10 0"
        "binde=, right, moveactive, 10 0"
        "binde=, up, moveactive, 0 -10"
        "binde=, down, moveactive, 0 10"
        "bind=, escape, submap, reset"
        "bind=, return, submap, reset"
        "submap=reset"
      ];

      # Mouse bindings (existing)
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
