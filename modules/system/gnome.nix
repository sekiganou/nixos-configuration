{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.gnome.enable = lib.mkEnableOption "Enable GNOME environment";
  };

  config = lib.mkIf config.system.gnome.enable {
    programs.dconf.enable = true;
    services.gnome.evolution-data-server.enable = true;
    # optional to use google/nextcloud calendar
    services.gnome.gnome-online-accounts.enable = true;
    # optional to use google/nextcloud calendar
    services.gnome.gnome-keyring.enable = true;
  };
}
