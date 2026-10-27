# 系统软件模块：系统包、zsh、npm、GnuPG。
{ ... }:

{
  imports = [
    ./systemPackages.nix
    ./zsh.nix
    ./npm.nix
    ./gnupg.nix
  ];
}
