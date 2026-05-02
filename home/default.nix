inputs:
let
  mkHome =
    {
      system,
      username,
      modules,
    }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          inputs.nur-yadokani.overlays.nur
          inputs.nur-onestep.overlays.nur
        ];
      };
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs; };
      inherit pkgs;
      modules = [
        {
          imports = modules;
          nix.package = pkgs.nix;
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "26.05";
            sessionVariables.EDITOR = "hx";
          };
        }
      ];
    };
in
{
  home-cli-minimal = mkHome {
    system = "x86_64-linux";
    username = "onestep";
    modules = [
      ./cui/minimal.nix
    ];
  };
  home-cli-full = mkHome {
    system = "x86_64-linux";
    username = "onestep";
    modules = [
      ./cui/full.nix
    ];
  };
  home-gui = mkHome {
    system = "x86_64-linux";
    username = "onestep";
    modules = [
      ./cui/full.nix
      ./gui/default.nix
    ];
  };
}
