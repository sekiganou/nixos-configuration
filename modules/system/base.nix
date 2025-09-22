{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.base.enable = lib.mkEnableOption "Enable base system configuration";
  };

  config = lib.mkIf config.system.base.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Enable zsh at system level (required when users.defaultUserShell = pkgs.zsh)
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    system.stateVersion = "25.05";
  };
}
