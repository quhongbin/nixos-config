# laptop 主机：物理机（NVIDIA GTX 1050 Ti）。
# 专属：nvidia 驱动、waybar 背光（见 home/waybar.nix 中的 host 判断）。
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
    ../../modules/desktop/nvidia.nix
  ];
}
