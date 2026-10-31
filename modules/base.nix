# 基本配置：引导、网络、时区、locale、nix 设置、用户、SSH、系统状态等。
{ config, lib, pkgs, ... }:

{
  # 引导加载器（GRUB + EFI）。
  boot.loader = {
    grub = {
      device = "nodev"; # or "nodev" for efi only
      enable = true;
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  # hostName was setted by defferent hosts/* configuration
  # networking.hostName = "nixos-1";

  # 使用 NetworkManager 管理网络连接。
  networking.networkmanager.enable = true;

  # 网络代理 is setted by various hosts
  # networking.proxy.default = "http://192.168.3.17:7897";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # 时区。
  time.timeZone = "Asia/Shanghai";

  # 软件源镜像。
  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 国际化。
  i18n.defaultLocale = "en_US.UTF-8";

  # zsh：系统级启用（写入 /etc/shells、生成 /etc/zshrc 带 nix PATH）。
  # 用户级插件/语法高亮等由 home-manager 管理，见 home/zsh.nix。
  programs.zsh.enable = true;

  # 用户。
  users.users.xiaoqu = {
    isNormalUser = true;
    description = "first user";
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.zsh;
    password = "xiaoqu";
    packages = with pkgs; [
      vim
    ];
  };

  # OpenSSH。
  services.openssh.enable = true;

  # 注意：使用 flake 时 system.copySystemConfiguration 不受支持；
  # 配置已通过 /run/current-system/flake 自动保留，无需再复制。

  system.stateVersion = "26.05";
}
