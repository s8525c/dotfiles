{
  description = "A SEBNix WSL configuration";

  inputs = {
    sebnix.url = "git+https://github.sebank.se/sebnix/sebnix.git";
    nixpkgs.follows = "sebnix/nixpkgs";

    dotfiles = {
      url = "github:s8525c/dotfiles";
      flake = false;
    };
  };

  outputs = inputs: {
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    nixosConfigurations.wsl = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        inputs.sebnix.nixosModules.seb
        ./system.nix
        {
          home-manager.sharedModules = [
            {
              _module.args = {
                inherit (inputs) dotfiles;
              };
            }
          ];
        }
      ];
    };
  };
}
