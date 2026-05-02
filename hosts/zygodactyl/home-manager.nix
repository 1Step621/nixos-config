username:
{
  pkgs,
  ...
}:
{
  imports = [
    ../../home/gui
    ../../home/cui/full.nix
  ];

  programs.niri.settings = {
    input.keyboard.xkb.layout = "jp";
    binds = {
      "Mod+U".action.focus-monitor-previous = { };
      "Mod+I".action.focus-monitor-next = { };
    };
  };

  programs.git.settings.user = {
    name = "1Step621";
    email = "onestep621@gmail.com";
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
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
  };
}
