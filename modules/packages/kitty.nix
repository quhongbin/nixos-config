# kitty 配置：从 quhongbin/kitty-config（一个 nix flake）拉取配置文件，
# 系统级构建并安装 kitty，然后把仓库 kitty/ 下的配置文件链接到 ~/.config/kitty/。
{ config, lib, pkgs,... }:

let
  # flake input 的源码树（已固定在 nix store 中，由 flake.lock 锁定版本）。
  home = config.users.users.xiaoqu.home;
	kittyRepo = pkgs.fetchFromGitHub{
		owner = "quhongbin";
		repo = "kitty-config";
		rev = "4bc08a046f7fc9bb445d4570456454b77411d8e0";
		hash = "sha256-sUbAiOuoveY8OStxzqOkpyvPiRU3plM8iDRfi22wLl4=";
	};
in
{

  # 把仓库里的 config.kdl 与 dms/ 片段链接到用户家目录。
  # config.kdl 末尾通过 include "dms/binds.kdl" 引用 dms 下的片段。
  systemd.tmpfiles.rules = [
    "d ${home}/.config 0755 xiaoqu users -"
    "d ${home}/.config/kitty 0755 xiaoqu users -"
    "L+ ${home}/.config/kitty/kitty.conf 0755 xiaoqu users - ${kittyRepo}/kitty.conf"
    "L+ ${home}/.config/kitty/Gruvbox\\x20Dark\\x20Soft.conf 0755 xiaoqu users - ${kittyRepo}/Gruvbox\\x20Dark\\x20Soft.conf"
  ];
}
