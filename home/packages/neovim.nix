# neovim 配置：home-manager 管理。
# 从 quhongbin/MyLazyVim 拉取配置，链接到 ~/.config/nvim。
{ pkgs, ... }:

let
  NeovimConfigFiles = pkgs.fetchFromGitHub {
    owner = "quhongbin";
    repo = "MyLazyVim";
    rev = "92fd569f2db6dc3fe865d4099219196448c2e2db";
    hash = "sha256-MIeYtVYp91uFLk1j1LV3PfweJA/mPD88PATEJBRSw/M=";
  };
in
{
  programs.neovim = {
    enable = true;
  };
  home.file.".config/nvim".source = NeovimConfigFiles;
  # lazyvim needed modules
  home.packages = with pkgs;[
    ripgrep
    lua51Packages.lua
    # C Compiler has been installed by another nix file home/develop/cpp.nix
  ];
}
