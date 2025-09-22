{
  config,
  lib,
  pkgs,
  ...
}: {
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

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell"; # pick your theme
        plugins = ["git" "z" "sudo"];
      };

      shellAliases = {
        ll = "ls -lah";
        la = "ls -A";
        l = "ls -CF";
      };
    };
  };
}
