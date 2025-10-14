{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.neovim.enable = lib.mkEnableOption "Neovim configuration";
  };

  config = lib.mkIf config.home-manager.neovim.enable {
    programs.neovim = {
      enable = true;
      # viAlias = true;
      # vimAlias = true;
      #   extraConfig = ''
      #     " Enable line numbers
      #     set number

      #     " Enable relative line numbers
      #     set relativenumber

      #     " Set tab width to 4 spaces
      #     set tabstop=4
      #     set shiftwidth=4
      #     set expandtab

      #     " Enable syntax highlighting
      #     syntax on

      #     " Set color scheme (optional)
      #     colorscheme desert

      #     " Enable mouse support
      #     set mouse=a

      #     " Enable clipboard integration
      #     set clipboard=unnamedplus

      #     " Other custom configurations can be added here
      #   '';
      # };
    };
  };
}
