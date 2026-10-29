# home-manager 集成：home/ 目录下的用户级配置统一由 home-manager 管理。
{ ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.users.xiaoqu = {
    home.stateVersion = "26.05";
    imports = [ ../home ];
  };
}
