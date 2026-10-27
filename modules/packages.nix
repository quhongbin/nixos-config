# 系统软件：系统级安装的包与启用的程序。
{ config, lib, pkgs, ... }:

{
  # 系统级安装的软件包。
  environment.systemPackages = with pkgs; [
    vim # 编辑器，避免无编辑器可用
    wget
    git
    kitty
    alacritty
    fuzzel
    xwayland-satellite
    mako
    wl-clipboard
    brightnessctl
    playerctl
		google-chrome
  ];

  # npm。
  programs.npm.enable = true;

  # zsh 及其语法高亮。
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };

  # GnuPG agent（含 SSH 支持）。
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
