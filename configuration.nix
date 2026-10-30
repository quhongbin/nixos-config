# 通用配置：所有主机共享的模块集合（主机专属的硬件与驱动配置见 hosts/）。
{ ... }:

{
  imports = [
    ./modules/base.nix
    ./modules/home-manager.nix
    ./modules/packages
    ./modules/desktop
    ./modules/fonts
  ];
}
