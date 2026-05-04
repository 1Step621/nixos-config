{ pkgs, inputs, ... }:
{

  imports = [ ./programs ];

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
      "text/plain" = "dev.zed.Zed";
      "text/csv" = "dev.zed.Zed";
      "text/x-c++hdr" = "dev.zed.Zed";
      "text/x-c++src" = "dev.zed.Zed";
      "text/x-python" = "dev.zed.Zed";
      "text/x-shellscript" = "dev.zed.Zed";
      "text/x-java" = "dev.zed.Zed";
      "text/x-csharp" = "dev.zed.Zed";
      "text/x-go" = "dev.zed.Zed";
      "text/x-rust" = "dev.zed.Zed";
      "text/x-javascript" = "dev.zed.Zed";
      "text/x-typescript" = "dev.zed.Zed";
      "text/markdown" = "dev.zed.Zed";
      "application/yaml" = "dev.zed.Zed";
      "application/json" = "dev.zed.Zed";
      "application/xml" = "dev.zed.Zed";
      "text/x-cmake" = "dev.zed.Zed";
      "application/toml" = "dev.zed.Zed";
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

  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-Nord-Dark";
      package = pkgs.colloid-icon-theme.override {
        schemeVariants = [ "nord" ];
      };
    };

    theme = {
      name = "Colloid-Dark-Nord";
      package = pkgs.colloid-gtk-theme.override {
        tweaks = [
          "nord"
          "normal"
        ];
      };
    };

    gtk4.theme = {
      name = "Colloid-Dark-Nord";
      package = pkgs.colloid-gtk-theme.override {
        tweaks = [
          "nord"
          "normal"
        ];
      };
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "Noto Sans CJK JP";
      package = pkgs.noto-fonts-cjk-sans;
    };
  };
}
