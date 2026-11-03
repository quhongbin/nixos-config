{ config, pkgs, pkgsUnstable, ... }:

let
  pnpmHome = "${config.home.homeDirectory}/.local/share/pnpm";
in
{
  home.packages = [
    pkgsUnstable.pnpm
  ];

  home.sessionVariables = {
    PNPM_HOME = pnpmHome;
  };

  home.sessionPath = [
    "${pnpmHome}/bin"
  ];
}
