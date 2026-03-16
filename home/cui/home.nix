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
      cloudflared
      ffmpeg
      python3
      probe-rs-tools
    ];

    sessionVariables = {
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
  };
}
