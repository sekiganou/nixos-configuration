{ config, lib, pkgs, ... }:
{
  options = {
    home-manager.vscode.enable = lib.mkEnableOption "Enable VSCode with extensions";
  };

  config = lib.mkIf config.home-manager.vscode.enable {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;
      profiles.default.extensions = with pkgs.vscode-extensions; [
          mhutchie.git-graph
          bbenoist.nix
          ms-python.python
          ms-azuretools.vscode-docker
          ms-vscode-remote.remote-ssh
          jnoortheen.nix-ide
          github.copilot
          # github.copilot-chat
          ms-vscode.makefile-tools
          ms-azuretools.vscode-containers
          prisma.prisma
          vscjava.vscode-java-pack
          vscjava.vscode-java-debug
          redhat.java
          vscjava.vscode-java-test
          vscjava.vscode-maven
          vscjava.vscode-gradle
          vscjava.vscode-java-dependency
          visualstudioexptteam.vscodeintellicode
          esbenp.prettier-vscode
          nonylene.dark-molokai-theme
          catppuccin.catppuccin-vsc
          dracula-theme.theme-dracula
          tomoki1207.pdf
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "theme-monokai-pro-vscode";
          publisher = "monokai";
          version = "2.0.7";
          sha256 = "sha256-MRFOtadoHlUbyRqm5xYmhuw0LL0qc++gR8g0HWnJJRE=";
        }
        # {
        #   name = "copilot-chat";
        #   publisher = "GitHub";
        #   version = "0.32.2025091902";
        #   sha256 = "sha256-ApUDvN1yYX3urdFFj4w4H1Jj4bIUFhmx3pi4ecRTLJ4=";
        # }
      ];

      userSettings = {
        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
        "extensions.ignoreRecommendations" = true;
        "workbench.colorTheme" = "Monokai Pro (Filter Octagon)";
        "workbench.iconTheme" = "Monokai Pro (Filter Octagon) Icons";
      };


    };

  };
}
