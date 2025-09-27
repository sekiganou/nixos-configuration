{
  config,
  lib,
  pkgs,
  ...
}: {
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
        categories = ["Network" "Email"];
        startupNotify = true;
      };

      youtube = {
        name = "YouTube";
        comment = "YouTube web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://www.youtube.com";
        icon = "youtube";
        categories = ["Network" "Video"];
        startupNotify = true;
      };

      jellyfin = {
        name = "Jellyfin";
        comment = "Jellyfin web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://jellyfin.dojo-vernier.ts.net";
        icon = "jellyfin";
        categories = ["Network" "Video"];
        startupNotify = true;
      };

      vikunja = {
        name = "Vikunja";
        comment = "Vikunja web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://vikunja.dojo-vernier.ts.net";
        icon = "vikunja";
        categories = ["Network" "Office"];
        startupNotify = true;
      };

      duelvault = {
        name = "DuelVault";
        comment = "DuelVault web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://duelvault.dojo-vernier.ts.net";
        icon = "duelvault";
        categories = ["Network" "Office"];
        startupNotify = true;
      };

      tailscale = {
        name = "Tailscale";
        comment = "Tailscale web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://login.tailscale.com";
        icon = "tailscale";
        categories = ["Network" "Office"];
        startupNotify = true;
      };

      tailscale-interface = {
        name = "Tailscale Interface";
        comment = "Tailscale web app";
        exec = "${pkgs.chromium}/bin/chromium --app=http://100.100.100.100";
        icon = "tailscale";
        categories = ["Network" "Office"];
        startupNotify = true;
      };

      rsi = {
        name = "RSI";
        comment = "RSI web app";
        exec = "${pkgs.chromium}/bin/chromium --app=https://www.rsi.ch";
        icon = "rsi";
        categories = ["Network" "Video"];
        startupNotify = true;
      };

      # nextcloud = {
      #   name = "Nextcloud";
      #   comment = "Nextcloud web app";
      #   exec = "${pkgs.chromium}/bin/chromium --app=https://nextcloud.dojo-vernier.ts.net";
      #   icon = "nextcloud";
      #   categories = [ "Network" "Office" ];
      #   startupNotify = true;
      # };

      # unito = {
      #   name = "Unito";
      #   comment = "Unito web app";
      #   exec = "${pkgs.chromium}/bin/chromium --app=https://informatica.i-learn.unito.it";
      #   icon = "unito";
      #   categories = [ "Network" "Office" ];
      #   startupNotify = true;
      # };

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
