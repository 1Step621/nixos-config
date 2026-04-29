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
      { command = [ "waybar" ]; }
      { command = [ "awww-daemon" ]; }
      {
        command = [
          "wl-paste"
          "--watch"
          "cliphist"
          "store"
        ];
      }
      { command = [ "arrpc" ]; }
    ];
    hotkey-overlay.skip-at-startup = true;
    cursor.theme = "Bibata-Modern-Classic";
    cursor.hide-after-inactive-ms = 10000;
    layout = {
      tab-indicator = {
        width = 8;
        gap = 8;
        corner-radius = 4;
        length.total-proportion = 0.5;
        place-within-column = true;
        hide-when-single-tab = true;
        active.color = "#4e7682";
        inactive.color = "#333333";
      };
      default-column-width.proportion = 0.5;
      focus-ring = {
        active.gradient = {
          angle = 45;
          from = "#4e7682";
          to = "#1b5262";
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
            namespace = "waybar";
          }
        ];
        background-effect = {
          blur = true;
          xray = false;
        };
      }
    ];
  };
}
