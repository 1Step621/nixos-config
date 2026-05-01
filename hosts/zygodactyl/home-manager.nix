username:
{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../../home/gui/home.nix
    ../../home/cui/home.nix
    ../../home/cui/minimal.nix
  ];

  programs.niri.settings = {
    input.keyboard.xkb.layout = "jp";
    binds = {
      "Mod+U".action.focus-monitor-previous = { };
      "Mod+I".action.focus-monitor-next = { };
    };
  };

  programs.home-manager.enable = true;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
      nvtopPackages.nvidia
      btop-cuda
    ];

    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "zen-beta";
      TERMINAL = "kitty";
      GSK_RENDERER = "gl";
    };
  };
}
