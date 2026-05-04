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
    (arrpc.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "1Step621";
        repo = "arrpc";
        rev = "af8dabef740c5d2e1d31f66498aebdad61086db0";
        sha256 = "sha256-Luu/lmqbtYiw92bby1aJozL5bjUWkxrn9pt1XOO8uyQ=";
      };
    })
  ];
}
