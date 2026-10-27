# 系统级安装的软件包。
{ pkgs, ... }:

{
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
}
