{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Configure kitty terminal
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "JetBrains Mono Nerd Font";
        font_size = 11;
        
        # Theme
        foreground = "#dddddd";
        background = "#000000";
        background_opacity = "0.5";
        
        # Window settings
        window_padding_width = 10;
        confirm_os_window_close = 0;
      };
    };
  };
}
