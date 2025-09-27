{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.feishin.enable = lib.mkEnableOption "Feishin configuration";
  };

  config = lib.mkIf config.home-manager.feishin.enable {
    home.packages = [
      pkgs.feishin
    ];
  };
}
