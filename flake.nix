{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # 固定到具体 commit，避免解析 HEAD 时触发 GitHub API 限流。
    niri-config.url = "github:quhongbin/niri-config/0a85cbfe7ceb875efac02b9554423a2855e8cab0";
  };

  outputs = { self, nixpkgs, niri-config }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit niri-config; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
