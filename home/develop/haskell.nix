{ pkgs, ... }:
let
  hPkgs = pkgs.haskellPackages;
in
{
  home.packages = with hPkgs; [
    ghc
    cabal-install
    haskell-language-server
    ormolu          # 或 fourmolu，格式化
    hlint           # linter
  ];
}
