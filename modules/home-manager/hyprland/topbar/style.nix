''
  * {
    font-family: JetBrains Mono Nerd Font, Material Symbols, sans-serif;
    font-size: 13px;
  }

  window#waybar {
    background-color: rgba(19, 19, 23, 0.9);  /* Background with opacity */
    border-bottom: 2px solid rgba(194, 193, 255, 0.9);  /* Primary color border */
    color: #e5e1e7;  /* On surface color */
    transition-property: background-color;
    transition-duration: .5s;
  }

  button {
    box-shadow: inset 0 -3px transparent;
    border: none;
    border-radius: 0;
  }

  #workspaces button {
    padding: 0 8px;
    background-color: transparent;
    color: #e5e1e7;
    border-radius: 5px;
    margin: 2px;
  }

  #workspaces button:hover {
    background: rgba(53, 52, 56, 0.8);  /* Surface container highest */
  }

  #workspaces button.active {
    background-color: rgba(194, 193, 255, 0.3);  /* Primary with low opacity */
    color: #c2c1ff;  /* Primary color */
    box-shadow: inset 0 -3px #c2c1ff;
  }

  #workspaces button.urgent {
    background-color: rgba(255, 180, 171, 0.3);  /* Error color */
    color: #ffb4ab;
  }

  #clock,
  #battery,
  #cpu,
  #memory,
  #temperature,
  #network,
  #pulseaudio,
  #tray {
    padding: 0 12px;
    color: #e5e1e7;
    margin: 2px;
    border-radius: 5px;
    background: rgba(32, 31, 35, 0.6);  /* Surface container */
  }

  #window {
    margin: 0 4px;
    color: #c8c5d1;  /* On surface variant */
    font-weight: 500;
  }

  #battery.charging, #battery.plugged {
    color: #b5ccba;  /* Success color */
    background-color: rgba(55, 75, 62, 0.8);  /* Success container */
  }

  #battery.warning:not(.charging) {
    background-color: rgba(158, 100, 142, 0.8);  /* Warning */
    color: #f5b2e0;
  }

  #battery.critical:not(.charging) {
    background-color: rgba(147, 0, 10, 0.8);  /* Error container */
    color: #ffb4ab;  /* Error */
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  #pulseaudio.muted {
    color: #918f9a;  /* Outline - muted state */
  }

  #temperature.critical {
    background-color: rgba(147, 0, 10, 0.8);
    color: #ffb4ab;
  }

  @keyframes blink {
    to {
      background-color: rgba(147, 0, 10, 1);
    }
  }
''
