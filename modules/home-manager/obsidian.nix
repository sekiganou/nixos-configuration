{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    home-manager.obsidian.enable = lib.mkEnableOption "Enable Obsidian";
  };

  config = lib.mkIf config.home-manager.obsidian.enable {
    programs.obsidian = {
      enable = true;
      package = pkgs.obsidian;
      # vaults = {
      #   "Progr3" = {
      #     path = "~/Nextcloud/Uni/Progr3";
      #     # openOnStartup = true;
      #   };
      # };
    };
  };
}
