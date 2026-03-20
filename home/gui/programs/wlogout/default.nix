{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "empty-0";
        action = "";
      }
      {
        label = "empty-1";
        action = "";
      }
      {
        label = "empty-2";
        action = "";
      }
      {
        label = "empty-3";
        action = "";
      }
      {
        label = "lock";
        action = "hyprlock";
        keybind = "l";
      }
      {
        label = "empty-4";
        action = "";
      }
      {
        label = "empty-5";
        action = "";
      }
      {
        label = "logout";
        action = "niri msg action quit -s";
        keybind = "e";
      }
      {
        label = "empty-6";
        action = "";
      }
      {
        label = "empty-7";
        action = "";
      }
      {
        label = "reboot";
        action = "reboot";
        keybind = "r";
      }
      {
        label = "empty-8";
        action = "";
      }
      {
        label = "empty-9";
        action = "";
      }
      {
        label = "shutdown";
        action = "poweroff";
        keybind = "s";
      }
      {
        label = "empty-10";
        action = "";
      }
      {
        label = "empty-11";
        action = "";
      }
      {
        label = "empty-12";
        action = "";
      }
      {
        label = "empty-13";
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
        background: rgba(40, 44, 52, 0.7);
        border-radius: 8px;
        margin: 1rem;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        box-shadow: 0 0 0 0 transparent;
        border-width: 0px;
      }

      #lock {
        background-image: image(url("${./assets}/lock.svg"));
      }

      #lock:hover, #lock:focus {
        background-color: rgba(0, 47, 95, 0.7);
      }

      #logout {
        background-image: image(url("${./assets}/logout.svg"));
      }

      #logout:hover, #logout:focus {
        background-color: rgba(20, 56, 0, 0.7);
      }

      #reboot {
        background-image: image(url("${./assets}/reboot.svg"));
      }

      #reboot:hover, #reboot:focus {
        background-color: rgba(65, 40, 0, 0.7);
      }

      #shutdown {
        background-image: image(url("${./assets}/shutdown.svg"));
      }

      #shutdown:hover, #shutdown:focus {
        background-color: rgba(97, 0, 18, 0.7);
      }

      #empty-0, #empty-1, #empty-2, #empty-3, #empty-4, #empty-5, #empty-6, #empty-7, #empty-8, #empty-9, #empty-10, #empty-11, #empty-12, #empty-13 {
        opacity: 0;
      }
    '';
  };
}
