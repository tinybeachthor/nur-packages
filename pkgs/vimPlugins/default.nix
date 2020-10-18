{ pkgs, ... }:

with pkgs;
with { buildVimPluginFrom2Nix = pkgs.vimUtils.buildVimPluginFrom2Nix; };
{
  distilled-vim = pkgs.callPackage ./distilled-vim { inherit buildVimPluginFrom2Nix; };
}
