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
      dunst
      pavucontrol
      xdg-utils
      tokyonight-gtk-theme
      playerctl
      pamixer
      brightnessctl
      wl-clipboard
      nautilus
      krita
      wallpaper_random
      dragon-drop
      rquickshare
      grim
      slurp
      blender
      wf-recorder
      wf-recorder-toggle
      stm32cubemx
      inkscape
      fuzzel-network
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
      name = "Tokyonight-Dark";
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

  xdg.desktopEntries = {
    stm32cubeide = {
      name = "STM32CubeIDE";
      exec = "env GTK_THEME=Adwaita:light ${inputs.stm32cubeide.packages.x86_64-linux.default}/bin/stm32cubeide";
      terminal = false;
      type = "Application";
      categories = [
        "Development"
        "IDE"
      ];
    };
  };

  systemd.user.services.wallpaper-changer = {
    Unit.Description = "change wallpaper random";
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.wallpaper_random}/bin/wallpaper_random";
    };
  };

  systemd.user.timers.wallpaper-changer = {
    Unit = {
      Description = "change wallpaper random";
      Requires = [ "wallpaper-changer.service" ];
    };
    Timer = {
      Unit = "wallpaper-changer.service";
      OnBootSec = "10m";
      OnUnitActiveSec = "10m";
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
