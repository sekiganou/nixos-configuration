{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    system.syncthing.enable = lib.mkEnableOption "Syncthing configuration";
  };

  config = lib.mkIf config.system.syncthing.enable {
    services.syncthing = {
      enable = true;
      group = "users";
      user = "alessio";
      dataDir = "/home/alessio/syncthing"; # Default folder for new synced folders
      configDir = "/home/alessio/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}
