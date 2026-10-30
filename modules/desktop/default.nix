# 桌面相关模块：桌面环境、niri、音频、Portal、Polkit 与通用图形栈。
# 显卡驱动（nvidia / vmware）由各主机在 hosts/ 下单独引入。
{ ... }:

{
  imports = [
    ./systemDesktop.nix
    ./audio.nix
    ./portal.nix
    ./polkit.nix
    ./niri.nix
  ];

  # 通用图形栈（OpenGL/Vulkan），所有主机都需要。
  hardware.graphics.enable = true;
}
