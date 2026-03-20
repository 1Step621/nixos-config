{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "none-0";
        action = "";
      }
      {
        label = "none-1";
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
        label = "none-2";
        action = "";
      }
      {
        label = "none-3";
        action = "";
      }
    ];

    style = ''
      * {
        background: none;
      }

      window {
        background-color: rgba(0, 0, 0, .5);
      }

      button {
        background: rgba(200, 200, 220, .1);
        border-radius: 8px;
        box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .1), 0 0 rgba(0, 0, 0, .5);
        margin: 1rem;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border-width: 0px;
        outline-style: none;
      }

      button:focus, button:active, button:hover {
        background-color: rgba(200, 200, 220, .2);
      }

      #lock {
        background-image: image(url("${./assets}/lock.png"));
      }

      #logout {
        background-image: image(url("${./assets}/logout.png"));
      }

      #reboot {
        background-image: image(url("${./assets}/reboot.png"));
      }

      #shutdown {
        background-image: image(url("${./assets}/shutdown.png"));
      }

      #none-0, #none-1, #none-2, #none-3 {
        opacity: 0;
      }
    '';
  };
}
