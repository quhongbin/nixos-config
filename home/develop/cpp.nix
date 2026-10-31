{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    clang-tools   # 提供 clangd 和 clang-format
    cmake
    gnumake
  ];
}
