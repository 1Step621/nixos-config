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
        twemoji-color-font
        roboto-mono
        inter
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
          "Noto Emoji"
        ];
        emoji = [ "Noto Emoji" ];
      };
    };
  };
}
