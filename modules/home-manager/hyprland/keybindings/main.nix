{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      # Main modifier key
      "$mainMod" = "ALT";

      # Keybindings
      bind = [
        # Application shortcuts
        "$mainMod, W, exec, caelestia shell drawers toggle dashboard"
        "$mainMod, C, exec, kitty --hold bash -c 'neofetch'"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nemo"
        "$mainMod, V, togglefloating,"
        # "$mainMod, space, exec, rofi -show drun"
        "$mainMod, space, exec, caelestia shell drawers toggle launcher"
        "$mainMod, P, pseudo,"
        "$mainMod, F, exec, firefox"
        "$mainMod, N, exec, code ~/nixos-configura`tion"
        # "$mainMod, F, fullscreen,"
        # "SUPER, Escape, exec, wlogout"
        "$mainMod, Escape, exec, caelestia shell drawers toggle session"
        "CTRL SHIFT, Escape, exec, kitty --hold btop"

        # Screenshot
        "$mainMod, S, exec, grim -g \"$(slurp)\" - | wl-copy"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move focus with mainMod + hjkl
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Move windows with mainMod + SHIFT + hjkl
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

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

        # Move active window to workspace
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

        # Special workspace (scratchpad)
        "$mainMod, grave, togglespecialworkspace, magic"
        "$mainMod SHIFT, grave, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Media keys
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"
        ",XF86AudioMute, exec, pamixer -t"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"

        # Brightness keys
        ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"

        # Night mode toggle
        # "$mainMod, N, exec, pkill gammastep || gammastep -O 4000"
        # "$mainMod SHIFT, N, exec, pkill gammastep"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
