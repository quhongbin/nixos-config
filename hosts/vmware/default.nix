# vmware 主机：VMware 虚拟机。
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
    ../../modules/desktop/vmware.nix
  ];
}
