{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.fastfetch.enable = lib.mkEnableOption "Fastfetch configuration";
  };
  config = lib.mkIf config.home-manager.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = null;
        display = {
          separator = " ";
          color = "white";
        };
        modules = [
          "break"
          {
            type = "custom";
            key = "┌─────────────────────────────────────────┐";
            keyColor = "cyan";
          }
          {
            type = "os";
            key = "│ {#cyan}󰻀 {#magenta}OS{#}      ";
            format = "{#white}{pretty-name}{#cyan} │{#}";
          }
          {
            type = "kernel";
            key = "│ {#cyan} {#magenta}Kernel{#}  ";
            format = "{#white}{release}{#cyan} │{#}";
          }
          {
            type = "packages";
            key = "│ {#cyan}󰏖 {#magenta}Packages{#}";
            format = "{#white}{all} (nix){#cyan} │{#}";
          }
          {
            type = "shell";
            key = "│ {#cyan} {#magenta}Shell{#}   ";
            format = "{#white}{pretty-name}{#cyan} │{#}";
          }
          {
            type = "custom";
            key = "├─────────────────────────────────────────┤";
            keyColor = "cyan";
          }
          {
            type = "command";
            key = "│ {#cyan} {#magenta}Uptime{#}  ";
            text = "uptime -p | cut -d ' ' -f 2-";
            format = "{#white}{}{#cyan} │{#}";
          }
          {
            type = "command";
            key = "│ {#cyan} {#magenta}Memory{#}  ";
            text = "free -h | awk 'NR==2{printf \"%s / %s\",$3,$2}'";
            format = "{#white}{}{#cyan} │{#}";
          }
          {
            type = "custom";
            key = "├─────────────────────────────────────────┤";
            keyColor = "cyan";
          }
          {
            type = "command";
            key = "│ {#cyan} {#magenta}User{#}    ";
            text = "echo $USER";
            format = "{#white}{}{#cyan} │{#}";
          }
          {
            type = "command";
            key = "│ {#cyan}󰟀 {#magenta}Host{#}    ";
            text = "hostnamectl hostname";
            format = "{#white}{}{#cyan} │{#}";
          }
          {
            type = "custom";
            key = "└─────────────────────────────────────────┘";
            keyColor = "cyan";
          }
          "break"
          {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
          }
        ];
      };
    };
  };
}
