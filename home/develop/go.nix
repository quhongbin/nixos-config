{ config, pkgs, ... }:
{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/go";
      GOTOOLCHAIN = "local"; # 使用 Nix 安装的 Go，而不是自动下载工具链
    };
  };

  home.packages = with pkgs; [
    gopls          # LSP
    gofumpt        # 更严格的 gofmt
    gotools        # 包含 goimports 等辅助工具
    golangci-lint  # 综合 linter
  ];

  home.sessionPath = [
    "${config.programs.go.env.GOPATH}/bin"
  ];
}
