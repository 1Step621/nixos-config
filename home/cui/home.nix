{ pkgs, ... }:
{

  imports = [
    ./programs
  ];

  home = {
    packages = with pkgs; [
      gh
      mold-unwrapped
      jq
      uv
      nodejs
      fd
      evcxr
      ffmpeg
      python3
      clang-tools
      arrpc
    ];

    sessionVariables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
  };
}
