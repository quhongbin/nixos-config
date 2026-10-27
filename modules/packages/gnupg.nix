# GnuPG agent（含 SSH 支持）。
{ ... }:

{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
