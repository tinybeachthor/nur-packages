{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;
    haskell-updates-pkgs.url = github:NixOS/nixpkgs/haskell-updates;
  };
  outputs = { self, nixpkgs, haskell-updates-pkgs }: {
    packages.x86_64-linux = import ./default.nix {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      haskell-updates-pkgs = import haskell-updates-pkgs { system = "x86_64-linux"; };
    };
    overlay = final: prev: {
      nur = import ./default.nix {
        pkgs = prev;
        haskell-updates-pkgs = import haskell-updates-pkgs { system = "x86_64-linux"; };
      };
    };
  };
}
