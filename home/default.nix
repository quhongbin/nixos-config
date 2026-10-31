# home-manager 模块汇总：home/ 下的每个 *.nix 都是一个 home-manager 模块。
{ ... }:

{
  imports = [
    ./packages/lazygit.nix
    ./package/neovim.nix
    ./package/emacs.nix
    ./package/zsh.nix
    # user services
    ./services/swaybg.nix
    ./services/waybar.nix
    ./services/wofi.nix
    ./services/i18n.nix
    ./services/mako.nix
  ];
}
