# laptop 主机：物理机（NVIDIA GTX 1050 Ti）。
# 专属：nvidia 驱动、waybar 背光（见 home/waybar.nix 中的 host 判断）。
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

  # NVIDIA 专有驱动是 unfree 许可，需显式允许。
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-home";
  networking.proxy.default = "http://192.168.1.4:7897";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
    ../../modules/desktop/nvidia.nix
  ];
}
