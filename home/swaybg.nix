{ config, pkgs, lib, ... }:

let
  wallpaper = "${config.home.homeDirectory}/Pictures/wallpaper.jpg";
in
{
  systemd.user.services.swaybg = {
    Unit = {
      Description = "Wallpaper daemon for Wayland";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${lib.getExe pkgs.swaybg} --image ${wallpaper} --mode fill";
      Restart = "on-failure";
    };
  };
}
