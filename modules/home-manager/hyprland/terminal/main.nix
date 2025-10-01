{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home-manager.hyprland.enable {
    # Configure Foot terminal (Caelestia's terminal of choice)
    programs.foot = {
      enable = true;
      settings = {
        main = {
          shell = "fish";  # Use fish shell
          font = "JetBrains Mono Nerd Font:size=12";
          letter-spacing = 0;
          dpi-aware = false;
          pad = "25x25";
          bold-text-in-bright = false;
        };

        scrollback = {
          lines = 10000;
        };

        cursor = {
          style = "beam";
          beam-thickness = 1.5;
        };

        colors = {
          alpha = 0.78;  # Caelestia uses 78% opacity
          # Caelestia color scheme will be applied via theme
        };

        key-bindings = {
          scrollback-up-page = "Page_Up";
          scrollback-down-page = "Page_Down";
          search-start = "Control+Shift+f";
        };

        search-bindings = {
          cancel = "Escape";
          find-prev = "Shift+F3";
          find-next = "F3 Control+G";
        };
      };
    };

    # Configure Fish shell (Caelestia uses Fish instead of ZSH)
    programs.fish = {
      enable = true;
      
      shellAliases = {
        ll = "eza -lah --icons";
        la = "eza -A --icons";
        l = "eza --icons";
        ls = "eza --icons";
        tree = "eza --tree --icons";
      };

      shellInit = ''
        # Disable greeting
        set fish_greeting
        
        # Set theme colors to match Caelestia
        set -U fish_color_normal e5e1e7
        set -U fish_color_command c2c1ff
        set -U fish_color_keyword c2c1ff
        set -U fish_color_quote 44def5
        set -U fish_color_error ffb4ab
        set -U fish_color_param e5e1e7
        set -U fish_color_comment 918f9a
        set -U fish_color_selection --background=353438
        set -U fish_color_search_match --background=353438
        set -U fish_color_operator c6c4e0
        set -U fish_color_escape b0b8ff
        set -U fish_color_autosuggestion 6b6972
      '';
    };

    # Starship prompt configuration (Caelestia uses Starship)
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      
      settings = {
        # Minimal Caelestia-style prompt
        format = lib.concatStrings [
          "$directory"
          "$git_branch"
          "$git_status"
          "$character"
        ];

        character = {
          success_symbol = "[❯](bold c2c1ff)";
          error_symbol = "[❯](bold ffb4ab)";
        };

        directory = {
          style = "bold c2c1ff";
          truncation_length = 3;
          truncate_to_repo = true;
        };

        git_branch = {
          style = "bold c6c4e0";
          symbol = " ";
        };

        git_status = {
          style = "bold f5b2e0";
        };
      };
    };

    # Keep Kitty as fallback but configure it with Caelestia colors
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "JetBrains Mono Nerd Font";
        font_size = 11;

        # Caelestia color scheme
        foreground = "#e5e1e7";
        background = "#131317";
        background_opacity = "0.78";

        # Window settings
        window_padding_width = 25;
        confirm_os_window_close = 0;
      };
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = ["git" "z" "sudo"];
      };

      shellAliases = {
        ll = "eza -lah --icons";
        la = "eza -A --icons";
        l = "eza --icons";
      };
    };
  };
}
