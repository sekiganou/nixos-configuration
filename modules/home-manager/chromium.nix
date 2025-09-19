{ config, lib, pkgs, ... }:

{
  options = {
    home-manager.chromium.enable = lib.mkEnableOption "Enable Chromium";
  };

  config = lib.mkIf config.home-manager.chromium.enable {
    programs.chromium = {
      enable = true;
      
      # Optional: Configure extensions
      # extensions = [
      #   { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      #   { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      # ];
      
      # Optional: Set command line arguments
      # commandLineArgs = [
      #   "--enable-features=VaapiVideoDecoder"
      #   "--disable-features=UseChromeOSDirectVideoDecoder"
      #   "--enable-gpu-rasterization"
      # ];
    };

    # Optional: Create custom desktop entries for specific profiles or web apps
    xdg.desktopEntries = {
      # Example: Create a desktop entry for a specific web app
      gmail = {
        name = "Gmail";
        comment = "Gmail web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://mail.google.com";
        icon = "mail-mark-important";
        categories = [ "Network" "Email" ];
        startupNotify = true;
      };

      youtube = {
        name = "YouTube";
        comment = "YouTube web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://www.youtube.com";
        icon = "youtube";
        categories = [ "Network" "Video" ];
        startupNotify = true;
      };

      jellyfin = {
        name = "Jellyfin";
        comment = "Jellyfin web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://jellyfin.dojo-vernier.ts.net";
        icon = "jellyfin";
        categories = [ "Network" "Video" ];
        startupNotify = true;
      };

      # Example: Create a desktop entry for Chromium incognito mode
      # chromium-incognito = {
      #   name = "Chromium (Incognito)";
      #   comment = "Browse the web privately";
      #   exec = "${pkgs.chromium}/bin/chromium --incognito";
      #   icon = "chromium-browser";
      #   categories = [ "Network" "WebBrowser" ];
      #   startupNotify = true;
      # };
    };
  };
}