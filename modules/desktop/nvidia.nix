# 显卡驱动：NVIDIA GTX 1050 Ti（仅 laptop 物理机使用）。
{ ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  # NVIDIA GTX 1050 Ti (Pascal)：
  # - 新版 Game Ready 驱动(590/595)已不再支持 Pascal，需用 legacy_580 长期支持分支；
  # - Pascal 不支持 open 内核模块(仅 Turing 及更新支持)，必须用闭源模块；
  # - modesetting 是 niri/Wayland 正常渲染的前提。
  hardware.nvidia = {
    branch = "legacy_580";
    open = false;
    modesetting.enable = true;
    powerManagement.enable = true; # 笔记本省电（可选）
  };
}
