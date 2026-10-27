# 桌面相关模块：图形驱动、桌面环境、niri、音频、Portal、Polkit。
{ ... }:

{
  imports = [
    ./nvidia.nix
    ./systemDesktop.nix
    ./audio.nix
    ./portal.nix
    ./polkit.nix
    ./niri.nix
  ];
}
