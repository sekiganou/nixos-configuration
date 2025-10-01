{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Configure waybar - Styled for Caelestia theme
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 35;
          output = ["*"];

          modules-left = ["hyprland/workspaces"];
          modules-center = ["hyprland/window"];
          modules-right = ["pulseaudio" "network" "cpu" "memory" "temperature" "battery" "clock" "tray"];

          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            format = "{name}";
            on-click = "activate";
          };

          "hyprland/window" = {
            format = "{}";
            separate-outputs = true;
            max-length = 50;
          };

          tray = {
            spacing = 10;
          };

          clock = {
            format = "{:%H:%M}";
            format-alt = "{:%Y-%m-%d}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };

          cpu = {
            format = " {usage}%";
            tooltip = false;
          };

          memory = {
            format = " {}%";
          };

          temperature = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = ["" "" ""];
          };

          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = ["" "" "" "" ""];
          };

          network = {
            format-wifi = " {essid}";
            format-ethernet = " {ipaddr}";
            tooltip-format = "{ifname} via {gwaddr}";
            format-linked = " {ifname}";
            format-disconnected = "⚠ Disconnected";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };

          pulseaudio = {
            format = "{icon} {volume}%";
            format-bluetooth = " {icon} {volume}%";
            format-bluetooth-muted = "  {icon}";
            format-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
          };
        };
      };

      style = import ./style.nix;
    };
  };
}
