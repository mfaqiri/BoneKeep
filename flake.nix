{
  description = "BoneKeep nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { nixpkgs, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
     devShells.${system}.default =  (import ./shell.nix {inherit pkgs; inherit lib;});
    };
}
