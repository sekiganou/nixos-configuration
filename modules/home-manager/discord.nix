{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.discord.enable = lib.mkEnableOption "Discord configuration";
  };

  config = lib.mkIf config.home-manager.discord.enable {
    home.packages = [pkgs.discord];
  };
}
