{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      targets = [ "graphical-session.target" ];
    };
    style = ''
      * {
        font-family: "Roboto Mono", "Noto Sans CJK JP", sans-serif;
        font-size: 11pt;
        font-weight: bold;
        transition-property: background-color;
        transition-duration: 0.5s;
        color: #abb2bf;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        background-color: rgba(40, 44, 52, 0.75);
        padding: 3px;
        padding-left: 8px;
        padding-right: 8px;
      }
      #workspaces {
        padding-left: 0px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
      }
      tooltip {
        background: rgba(40, 44, 52, 0.75);
      }
      tooltip label {
        color: #abb2bf;
      }
      #mode, #clock, #memory, #temperature, #cpu, #custom-media, #temperature, #backlight, #pulseaudio, #network, #custom-wf-recorder, #battery {
        padding-left: 10px;
        padding-right: 10px;
      }
      #custom-launcher {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #61afef;
      }
      #battery {
        color: #98c379;
      }
      #battery.warning {
        color: #e5c07b;
      }
      #battery.critical {
        color: #e06c75;
      }
      #memory {
        color: #56b6c2;
      }
      #cpu {
        color: #c678dd;
      }
      #clock {
        color: #abb2bf;
      }
      #custom-media {
        color: #abb2bf;
      }
      #temperature {
        color: #e5c07b;
      }
      #backlight {
        color: #e5c07b;
      }
      #pulseaudio {
        color: #56b6c2;
      }
      @keyframes blink_red {
        from {
          color: transparent;
        }
        to {
          color: #e06c75;
        }
      }
      #custom-wf-recorder {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      #network {
        color: #98c379;
      }
      #network.disconnected {
        color: #e06c75;
      }
      #custom-powermenu {
        color: #e06c75;
        padding-left: 6px;
        padding-right: 12px;
      }
    '';
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/launcher"
          "temperature"
          "custom/media"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "battery"
          "backlight"
          "memory"
          "cpu"
          "custom/wf-recorder"
          "network"
          "custom/powermenu"
        ];
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "exec wallpaper_random";
          "tooltip" = false;
        };
        "temperature" = {
          "format" = " {temperatureC}°C";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };
        "battery" = {
          "interval" = 1;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = "󱟦 {capacity}%";
          "format-full" = "󰁹 {capacity}%";
          "format-icons" = [
            "󰁻"
            "󰁿"
            "󰂁"
          ];
          "tooltip" = false;
        };
        "backlight" = {
          "format" = "󰖨 {percent}%";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%m/%d (%a) %H:%M}";
          "tooltip" = false;
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
          "tooltip" = false;
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
          "tooltip" = false;
        };
        "custom/media" = {
          "max-length" = 30;
          "exec" = ''
            playerctl -l | while read -r p; do [ "$(playerctl -p "$p" status 2>/dev/null)" = Playing ] && playerctl -p "$p" metadata title && break; done
          '';
          "on-click" = ''
            playerctl -l | while read -r p; do [ "$(playerctl -p "$p" status 2>/dev/null)" = Playing ] && playerctl -p "$p" play-pause && break; done
          '';
          "tooltip" = false;
          "interval" = 10;
        };
        "custom/wf-recorder" = {
          "exec" = "test -e \"$XDG_RUNTIME_DIR/wf-recorder.pid\" && printf '●'";
          "on-click" = "wf-recorder-toggle -f \"$HOME/Videos/screencaptures/$(date +%F-%H-%M-%S).mp4\"";
          "tooltip" = false;
          "interval" = 1;
        };
        "network" = {
          "format-disconnected" = "󰯡 ";
          "format-ethernet" = "󰒢 ";
          "format-linked" = "󰖪 ";
          "format-wifi" = "󰖩 ";
          "interval" = 10;
          "tooltip" = false;
          "on-click" = "fuzzel-network";
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" =
            "wlogout --buttons-per-row 6 --margin-top 440 --margin-bottom 440 --margin-left 360 --margin-right 360";
          "tooltip" = false;
        };
      }
    ];
  };
}
