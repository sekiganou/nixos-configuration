{ config, lib, pkgs, ... }:

{
  options = {
    home-manager.nemo.enable = lib.mkEnableOption "Nemo file manager configuration";
  };

  config = lib.mkIf config.home-manager.nemo.enable {
    # Configure Nemo actions directory
    xdg.dataFile."nemo/actions/open_in_terminal.nemo_action".text = ''
      [Nemo Action]
      Name=Open in Terminal
      Comment=Open folder in Kitty terminal
      Exec=kitty --working-directory %F
      Icon-Name=shell
      Selection=s
      Extensions=dir;
      Quote=double
      EscapeSpaces=true
    '';

    # Additional Nemo configuration via dconf
    dconf.settings = {
      "org/nemo/preferences" = {
        # Show hidden files by default (optional)
        show-hidden-files = false;
        # Set default view to list view (optional)
        default-folder-viewer = "list-view";
        # Enable thumbnails
        show-image-thumbnails = "always";
      };

      # Configure list view dimensions
      "org/nemo/list-view" = {
        # Increase the default zoom level for list view (values: "smallest", "smaller", "small", "standard", "large", "larger", "largest")
        default-zoom-level = "standard";
        # Set default visible columns in list view
        default-visible-columns = ["name" "size" "type" "date_modified"];
        # Set default column order
        default-column-order = ["name" "size" "type" "date_modified"];
      };

      # Configure icon view dimensions (in case you switch to icon view)
      "org/nemo/icon-view" = {
        # Increase default zoom level for icon view
        default-zoom-level = "large";
      };

      # Set Kitty as the default terminal for Nemo
      "org/gnome/desktop/default-applications/terminal" = {
        exec = "kitty";
        exec-arg = "--working-directory";
      };
    };

    # Ensure Nemo and required packages are installed
    home.packages = with pkgs; [
      nemo
      kitty
      # Required for proper file manager functionality
      gvfs
      # For thumbnails and previews
      ffmpegthumbnailer
      # For archive support
      file-roller
    ];
  };
}