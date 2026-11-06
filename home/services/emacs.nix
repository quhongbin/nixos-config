{ config, pkgs, lib, ... }:
{
  systemd.user.services.emacs = {
    Unit = {
      Description = "eamcs daemon for user";
      After = [ "multi-user.target" ];
    };
    Install.WantedBy = [ "multi-user.target" ];
    Service = {
      ExecStart = "${lib.getExe pkgs.emacs} --fg-daemon";
      Restart = "on-failure";
    };
  };
}
