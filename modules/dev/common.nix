{ config, lib, pkgs, ... }:
{
  virtualisation.docker.enable = true;
  
  environment.systemPackages = with pkgs; [
    git
    gnumake
  ];
  
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

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
}