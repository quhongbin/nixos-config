# 桌面环境与 niri：图形驱动、NVIDIA、显示管理器、Plasma 6、niri、
# Xwayland、Portal、音频等。
{ config, lib, pkgs, ... }:

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

  # 显示管理器：SDDM，默认会话为 niri。
  services.displayManager.enable = true;
  services.displayManager.defaultSession = "niri";
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # KDE Plasma 6 桌面。
  services.desktopManager.plasma6.enable = true;

  # Xwayland。
  programs.xwayland.enable = true;

  # XDG Portal。
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  # 音频（PipeWire）。
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Polkit。
  security.polkit.enable = true;
}
