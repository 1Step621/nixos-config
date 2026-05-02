{
  pkgs,
  ...
}:
{
  imports = [ ./programs/minimal.nix ];

  home.packages = with pkgs; [
    curl
    bat
    lazygit
    unzip
    wget
    eza
    zoxide
    ripgrep
    typst
    any-nix-shell
    cachix
    nixd
    nil
    mergiraf
  ];
}
