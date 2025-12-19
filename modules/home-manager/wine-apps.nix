{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.wine-apps.enable = lib.mkEnableOption "Enable Wine applications";
  };

  config = lib.mkIf config.home-manager.wine-apps.enable {
    home.packages = with pkgs; [
      wineWowPackages.stable
      winetricks
    ];
  };
}
