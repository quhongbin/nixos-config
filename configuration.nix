# Top-level configuration: imports the hardware scan result and the
# modular configuration. Replaces the old /etc/nixos/configuration.nix.
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/packages
    ./modules/desktop
  ];
}
