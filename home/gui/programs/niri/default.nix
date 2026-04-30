{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.niri-flake.homeModules.niri ];

  home.packages = with pkgs; [
    xwayland-satellite
    awww
  ];

  programs.niri.package = pkgs.niri;

  programs.niri.settings = {
    binds = import ./key-binds.nix;
    input = {
      focus-follows-mouse = {
        max-scroll-amount = "0%";
        enable = true;
      };
      keyboard.xkb.options = "caps:escape";
      warp-mouse-to-focus.enable = true;
      touchpad.dwt = true;
    };
    gestures.hot-corners.enable = false;
    prefer-no-csd = true;
    spawn-at-startup = [
      { command = [ "arrpc" ]; }
    ];
    hotkey-overlay.skip-at-startup = true;
    cursor.theme = "Bibata-Modern-Classic";
    cursor.hide-after-inactive-ms = 10000;
    layout = {
      tab-indicator = {
        width = 4;
        gap = 8;
        corner-radius = 2;
        length.total-proportion = 0.5;
        place-within-column = true;
        hide-when-single-tab = true;
        active.color = "#61afef";
        inactive.color = "#282c34";
      };
      default-column-width.proportion = 0.5;
      focus-ring = {
        active.gradient = {
          angle = 45;
          from = "#61afef75";
          to = "#3688cb75";
          in' = "oklab";
          relative-to = "workspace-view";
        };
      };
    };
    overview.backdrop-color = "#21252b";
    window-rules = [
      {
        clip-to-geometry = true;
        geometry-corner-radius = {
          top-left = 8.0;
          top-right = 8.0;
          bottom-left = 8.0;
          bottom-right = 8.0;
        };
        default-column-display = "tabbed";
      }
      {
        matches = [
          {
            app-id = "tauonmb";
          }
        ];
        open-floating = true;
      }
    ];
    layer-rules = [
      {
        matches = [
          {
            namespace = "dms";
          }
        ];
        background-effect = {
          xray = false;
        };
      }
      {
        matches = [
          {
            namespace = "launcher";
          }
        ];
        geometry-corner-radius = {
          top-left = 8.0;
          top-right = 8.0;
          bottom-left = 8.0;
          bottom-right = 8.0;
        };
        shadow = {
          enable = true;
          color = "#21252b3c";
          offset = {
            x = 0;
            y = 15;
          };
          softness = 35;
          spread = 10;
        };
        background-effect = {
          blur = true;
        };
      }
    ];
  };
}
