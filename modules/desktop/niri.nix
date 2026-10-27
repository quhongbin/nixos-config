# niri 配置：从 quhongbin/niri-config（一个 nix flake）拉取配置文件，
# 系统级构建并安装 niri，然后把仓库 niri/ 下的配置文件链接到 ~/.config/niri/。
{ config, lib, pkgs, niri-config, ... }:

let
  # flake input 的源码树（已固定在 nix store 中，由 flake.lock 锁定版本）。
  niriRepo = niri-config.outPath;
  home = config.users.users.xiaoqu.home;
in
{
  # 构建并安装 niri（Wayland 合成器）。
  programs.niri.enable = true;

  # 把仓库里的 config.kdl 与 dms/ 片段链接到用户家目录。
  # config.kdl 末尾通过 include "dms/binds.kdl" 引用 dms 下的片段。
  systemd.tmpfiles.rules = [
    "d ${home}/.config 0755 xiaoqu users -"
    "d ${home}/.config/niri 0755 xiaoqu users -"
    "L+ ${home}/.config/niri/config.kdl - - - - ${niriRepo}/niri/config.kdl"
    "L+ ${home}/.config/niri/dms - - - - ${niriRepo}/niri/dms"
  ];
}
