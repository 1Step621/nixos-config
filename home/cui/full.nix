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
        rev = "main";
        sha256 = "sha256-jzK/tRNZpNiWvRf+lSjOGmlzbuMCu2JYUz18ge6NPb4=";
      };
    })
  ];
}
