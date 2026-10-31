# vmware 主机：VMware 虚拟机。
{ ... }:

{
  # vmware derivers
  services.xserver.videoDrivers = [ "vmware" ];
  virtualisation.vmware.guest.enable = true;
  # hostName
  networking.hostName = "nixos-vmware";
  # network proxy
  networking.proxy.default = "http://192.168.3.17:7897";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
    ../../modules/desktop/vmware.nix
  ];
}
