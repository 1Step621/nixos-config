{ pkgs, inputs, ... }:
{

  imports = [
    ./programs
    ./themes
  ];

  home.packages =
    with pkgs;
    [
      wlr-randr
      pavucontrol
      xdg-utils
      playerctl
      pamixer
      brightnessctl
      wl-clipboard
      nautilus
      krita
      dragon-drop
      rquickshare
      grim
      slurp
      blender
      wf-recorder
      wf-recorder-toggle
      stm32cubemx
      inkscape
      hyprpicker
      libreoffice
      tauon
    ]
    ++ [ inputs.stm32cubeide.packages.x86_64-linux.default ];

  services = {
    kdeconnect = {
      enable = true;
      package = pkgs.kdePackages.kdeconnect-kde;
      indicator = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Colloid-Dark-Nord";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
      "application/pdf" = "org.gnome.Papers.desktop";
      "text/plain" = "code.desktop";
      "text/csv" = "code.desktop";
      "text/x-c++hdr" = "code.desktop";
      "text/x-c++src" = "code.desktop";
      "text/x-python" = "code.desktop";
      "text/x-shellscript" = "code.desktop";
      "text/x-java" = "code.desktop";
      "text/x-csharp" = "code.desktop";
      "text/x-go" = "code.desktop";
      "text/x-rust" = "code.desktop";
      "text/x-javascript" = "code.desktop";
      "text/x-typescript" = "code.desktop";
      "text/markdown" = "code.desktop";
      "application/yaml" = "code.desktop";
      "application/json" = "code.desktop";
      "application/xml" = "code.desktop";
      "text/x-cmake" = "code.desktop";
      "application/toml" = "code.desktop";
      "audio/mpeg" = "org.gnome.Decibels";
      "audio/vnd.wave" = "org.gnome.Decibels";
      "audio/ogg" = "org.gnome.Decibels";
      "audio/flac" = "org.gnome.Decibels";
      "audio/aac" = "org.gnome.Decibels";
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = "gtk";

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
