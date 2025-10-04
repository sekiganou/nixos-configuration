{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.tailscale.enable = lib.mkEnableOption "Enable Tailscale VPN client";
  };

  config = lib.mkIf config.system.tailscale.enable {
    environment.systemPackages = with pkgs; [
      tailscale
      trayscale # Unofficial GUI for Tailscale
    ];

    services.tailscale.enable = true;

    # create a oneshot job to authenticate to Tailscale
    systemd.services.tailscale-autoconnect = {
      description = "Automatic connection to Tailscale";

      # make sure tailscale is running before trying to connect to tailscale
      after = ["network-pre.target" "tailscale.service"];
      wants = ["network-pre.target" "tailscale.service"];
      wantedBy = ["multi-user.target"];

      # set this service as a oneshot job
      serviceConfig.Type = "oneshot";

      # have the job run this shell script
      script = with pkgs; ''
        # wait for tailscaled to settle
        sleep 2

        # check if we are already authenticated to tailscale
        status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
        if [ $status = "Running" ]; then # if so, then do nothing
          exit 0
        fi

        # otherwise authenticate with tailscale
        ${tailscale}/bin/tailscale up -authkey ../ts-auth.key
      '';
    };

    networking.firewall.trustedInterfaces = ["tailscale0"];
    networking.useNetworkd = true;

    networking.firewall.checkReversePath = "loose";
    networking.firewall.allowedUDPPorts = [41641]; # Tailscale
  };
}
