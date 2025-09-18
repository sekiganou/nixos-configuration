{ config, lib, pkgs, ... }:
{
#  options = {
#    home-manager.vscode.enable = lib.mkEnableOption "Enable VSCode with extensions";
#  };

#  config = lib.mkIf config.home-manager.vscode.enable {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        mhutchie.git-graph
        bbenoist.nix
        ms-python.python
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        jnoortheen.nix-ide
        github.copilot
        github.copilot-chat
        ms-vscode.makefile-tools
    ];
  };
#  };
}
