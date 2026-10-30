# home-manager 集成：home/ 目录下的用户级配置统一由 home-manager 管理。
{ host, ... }:

{
  home-manager.useGlobalPkgs = true;
  # 已有同名文件（如手写的 ~/.zshrc）时自动备份为 *.backup，而不是拒绝接管。
  home-manager.backupFileExtension = "backup";
  # 把主机名透传给 home-manager 模块，便于做主机专属配置（如 waybar 背光）。
  home-manager.extraSpecialArgs = { inherit host; };
  home-manager.users.xiaoqu = {
    home.stateVersion = "26.05";
    imports = [ ../home ];
  };
}
