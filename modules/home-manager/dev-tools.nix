{ config, lib, pkgs, ... }:

{
  options = {
    home-manager.dev-tools.enable = lib.mkEnableOption "Enable development tools";
  };

  config = lib.mkIf config.home-manager.dev-tools.enable {
    home.packages = with pkgs; [
      # git
      curl
      wget
      jq
      tree
      htop
      neofetch
      timer
    ];

    programs.git = {
      enable = true;
      userName = "Alessio Bagno";
      userEmail = "alessiobagno@gmail.com";
    };

    # programs.bash = {
    #   enable = true;
    #   bashrcExtra = ''
    #     # Custom aliases for development
    #     alias ll='ls -la'
    #     alias la='ls -A'
    #     alias l='ls -CF'
    #   '';
    # };
  };
}