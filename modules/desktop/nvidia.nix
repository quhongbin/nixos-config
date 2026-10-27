# 图形驱动：兼容 VMware 与 NVIDIA 1050 Ti。
{ ... }:

{
  # 同时兼容 VMware 虚拟机（vmware）与物理机 NVIDIA 1050 Ti（nvidia）。
  services.xserver.videoDrivers = [ "nvidia" "vmware" ];

  # 图形栈。
  hardware.graphics.enable = true;

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
