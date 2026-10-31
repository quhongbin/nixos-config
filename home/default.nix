# home-manager 模块汇总：home/ 下的每个 *.nix 都是一个 home-manager 模块。
{ ... }:

{
  imports = [
    ./packages/lazygit.nix
    ./packages/neovim.nix
    ./packages/emacs.nix
    ./packages/zsh.nix
    # user develop tools
    ./develop/cpp.nix
    ./develop/go.nix
    ./develop/haskell.nix
    ./develop/nix.nix
    ./develop/rust.nix
    # user services
    ./services/swaybg.nix
    ./services/waybar.nix
    ./services/wofi.nix
    ./services/mako.nix
    # internationality
    ./i18n.nix
  ];
}
