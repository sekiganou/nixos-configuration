{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    system.hyprland.enable = lib.mkEnableOption "Enable Hyprland system configuration";
  };

  config = lib.mkIf config.system.hyprland.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    # Enable GNOME Keyring for password storage
    services.gnome.gnome-keyring.enable = true;

    # Enable D-Bus for proper service communication
    services.dbus.enable = true;

    # Enable PAM support for gnome-keyring
    security.pam.services.login.enableGnomeKeyring = true;
    security.pam.services.passwd.enableGnomeKeyring = true;

    # System packages that need to be available system-wide
    environment.systemPackages = with pkgs; [
      # Essential system utilities
      brightnessctl # Brightness control (needs system access)
      pamixer # Audio control
      gnome-keyring # Keyring for storing passwords
    ];

    # Enable XDG desktop portal
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      ];
    };

    # Enable polkit for privilege escalation
    security.polkit.enable = true;

    # Enable fonts
    fonts.packages = with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        font-awesome
        # (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "DroidSansMono" ]; })
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };
}
