# 桌面环境：显示管理器（SDDM）、KDE Plasma 6、Xwayland。
{ ... }:

{
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
}
