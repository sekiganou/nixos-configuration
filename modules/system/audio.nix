{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.audio.enable = lib.mkEnableOption "Enable audio support (PipeWire)";
  };

  config = lib.mkIf config.system.audio.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
