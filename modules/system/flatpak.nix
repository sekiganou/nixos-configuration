{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    system.flatpak.enable = lib.mkEnableOption "Flatpak configuration";
  };

  config = lib.mkIf config.system.flatpak.enable {
    services.flatpak = {
      enable = true;
      packages = [
        "sh.ppy.osu"
      ];
      overrides = {
        "sh.ppy.osu" = {
          Context.filesystems = [
            "/home/alessio"
          ];
        };
      };
    };
  };
}
