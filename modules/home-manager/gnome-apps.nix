{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home-manager.gnome-apps = {
      enable = lib.mkEnableOption "Enable GNOME integration";
    };
  };

  config = lib.mkIf config.home-manager.gnome-apps.enable {
    home.packages = with pkgs; [
      gnome-calendar
      gnome-text-editor
      gnome-multi-writer
    ];

    home.sessionVariables = {
      XDG_CURRENT_DESKTOP = "GNOME gnome-control-center";
    };

    # programs.gnome = {
    #   enable = true;
    #   extensions = with pkgs.gnomeExtensions; [
    #   ];
    # };
  };
}
