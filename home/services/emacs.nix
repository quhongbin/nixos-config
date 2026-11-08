{ config, pkgs, lib, ... }:
{
  systemd.user.services.emacs = {
    Unit = {
      Description = "emacs daemon for user";
    };
    Install.WantedBy = [ "default.target" ];
    Service = {
      ExecStart = "${lib.getExe pkgs.emacs} --fg-daemon";
      Restart = "on-failure";
    };
  };
}
