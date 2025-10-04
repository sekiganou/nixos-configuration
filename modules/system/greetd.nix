{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.greetd.enable = lib.mkEnableOption "Enable greetd display manager with auto-login";
  };

  config = lib.mkIf config.system.greetd.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
        initial_session = {
          command = "Hyprland";
          user = "alessio";
        };
      };
    };

    # Ensure proper tty permissions for greetd
    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
