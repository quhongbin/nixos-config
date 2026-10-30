# laptop 主机硬件配置。
# TODO: 在 laptop 物理机上执行以下命令生成并替换本文件内容：
#   nixos-generate-config --show-hardware-config > hosts/laptop/hardware-configuration.nix
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # TODO: 在此处填入 laptop 的 fileSystems 与 swapDevices。
  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
