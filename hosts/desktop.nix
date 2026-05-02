{ pkgs, ... }:
{
  programs = {
    niri.enable = true;
  };

  services = {
    blueman.enable = true;

    displayManager.defaultSession = "niri";
    xserver.enable = true;

    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "gtk";

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  fonts = {
    enableDefaultPackages = false;
    packages =
      (with pkgs; [
        noto-fonts-cjk-sans
        noto-fonts-cjk-sans-static
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        noto-fonts-monochrome-emoji
        noto-fonts
        twemoji-color-font
        roboto-mono
        inter
        lmmath
      ])
      ++ (with pkgs.nerd-fonts; [
        roboto-mono
        noto
      ]);
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Emoji"
        ];
        sansSerif = [
          "Inter"
          "Noto Sans CJK JP"
          "Noto Emoji"
        ];
        monospace = [
          "RobotoMono Nerd Font Mono"
          "Noto Sans CJK JP"
          "Noto Emoji"
        ];
        emoji = [ "Noto Emoji" ];
      };
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>

          <match target="pattern">
            <test name="family" qual="any" compare="contains">
              <string>Noto Sans</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Inter</string>
            </edit>
          </match>

          <match>
            <test name="family" compare="eq">
              <string>Consolas</string>
            </test>
            <edit name="family" mode="assign" binding="strong">
              <string>Roboto Mono</string>
            </edit>
          </match>

        </fontconfig>
      '';
    };
  };
}
