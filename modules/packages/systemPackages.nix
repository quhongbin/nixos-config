# 系统级安装的软件包。
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # 编辑器，避免无编辑器可用
    wget
    git
    kitty
    xwayland-satellite
    wl-clipboard
    brightnessctl         # waybar called for brightness screen
    playerctl             # waybar called for music
    google-chrome
    wireplumber 	  # waybar called for audio
    networkmanagerapplet  # waybar called for network
    wqy_microhei
    uim
  ];
}
