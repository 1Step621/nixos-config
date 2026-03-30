{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages =
      (with pkgs; [
        noto-fonts-cjk-sans
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

        </fontconfig>
      '';
    };
  };
}
