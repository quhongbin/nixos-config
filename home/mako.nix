{ config, pkgs, lib, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      # --- 颜色（可接合系统配色方案）---
      background-color = "#358783";
      text-color       = "#d8dee9";
      border-color     = "#88c0d0";
      progress-color   = "over #a6e3a1ff";

      # --- 位置与尺寸 ---
      anchor      = "top-right";   # 屏幕角落：top-left, top-right, bottom-left, bottom-right 等
      layer       = "overlay";    # 显示层级：background, bottom, top, overlay
      width       = 380;          # 通知宽度 (px)
      height      = 150;          # 最大高度 (px)
      margin      = 12;           # 外边距 (px)
      padding     = 10;           # 内边距 (px)
      border-size = 2;
      border-radius = 12;

      # --- 字体与图标 ---
      font       = "Noto Sans 11"; # Pango 字体格式
      icons      = true;
      "max-icon-size" = 48;        # 图标最大尺寸 (px)
      # icon-path = "${pkgs.papirus-icon-theme}/share/icons/Papirus"; # 自定义图标主题

      # --- 行为 ---
      "default-timeout" = 5000;    # 默认超时 (ms)，0 为永不超时
      "ignore-timeout"  = false;   # 是否忽略发送方指定的超时
      actions           = true;    # 允许交互（如点击关闭）
      "max-visible"     = 5;       # 同屏最大通知数
      sort              = "-time"; # 排序：-time (最新在前), +time (最早在前), -urgency 等
      "group-by"        = "app-name"; # 按应用名分组
      markup            = true;    # 解析 Pango 标记
    };
  };
}
