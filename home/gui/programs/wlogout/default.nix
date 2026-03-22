{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "focus-stealer-l";
        action = "";
      }
      {
        label = "lock";
        action = "hyprlock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "niri msg action quit -s";
        keybind = "e";
      }
      {
        label = "reboot";
        action = "reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "poweroff";
        keybind = "s";
      }
      {
        label = "focus-stealer-r";
        action = "";
      }
    ];

    style = ''
      * {
        background: none;
      }

      window {
        background-color: rgba(0, 0, 0, 0.5);
      }

      button {
        background: rgba(40, 44, 52, 0.8);
        border-radius: 8px;
        margin: 1rem;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 35%;
        box-shadow: 0 0 0 0 transparent;
        border-width: 0px;
      }

      #lock {
        background-image: image(url("${./assets}/lock.svg"));
      }

      #lock:hover, #lock:focus {
        background-color: rgba(0, 47, 95, 0.8);
      }

      #logout {
        background-image: image(url("${./assets}/logout.svg"));
      }

      #logout:hover, #logout:focus {
        background-color: rgba(20, 56, 0, 0.8);
      }

      #reboot {
        background-image: image(url("${./assets}/reboot.svg"));
      }

      #reboot:hover, #reboot:focus {
        background-color: rgba(65, 40, 0, 0.8);
      }

      #shutdown {
        background-image: image(url("${./assets}/shutdown.svg"));
      }

      #shutdown:hover, #shutdown:focus {
        background-color: rgba(97, 0, 18, 0.8);
      }

      #focus-stealer-l, #focus-stealer-r {
        opacity: 0;
      }
    '';
  };
}
