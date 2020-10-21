{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;
  };
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = import ./default.nix {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    };
    overlay = final: prev: {
      nur = import ./default.nix {
        pkgs = prev;
      };
    };
  };
}
