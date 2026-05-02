{ pkgs, ... }:
{
  imports = [
    ./minimal.nix
    ./programs/full.nix
  ];

  home.packages = with pkgs; [
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
}
