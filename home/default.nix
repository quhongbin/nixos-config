# home-manager 模块汇总：home/ 下的每个 *.nix 都是一个 home-manager 模块。
{ ... }:

{
  imports = [
    ./lazygit.nix
    ./neovim.nix
    ./swaybg.nix
    ./waybar.nix
    ./wofi.nix
    ./zsh.nix
  ];
}
