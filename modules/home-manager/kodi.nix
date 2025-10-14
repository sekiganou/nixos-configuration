{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.kodi.enable = lib.mkEnableOption "Kodi configuration";
  };
  config = lib.mkIf config.home-manager.kodi.enable {
    programs.kodi = {
      enable = true;
      package = pkgs.kodi-wayland.passthru.withPackages (kodiPkgs:
        with kodiPkgs; [
          jellyfin
        ]);
    };
  };
}
