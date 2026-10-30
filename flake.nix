{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # 固定到具体 commit，避免解析 HEAD 时触发 GitHub API 限流。
    niri-config.url = "github:quhongbin/niri-config/0a85cbfe7ceb875efac02b9554423a2855e8cab0";
    # home-manager：跟随 nixpkgs，用 tarball URL 直接锁定 release-26.05，
    # 避免解析分支 HEAD 触发 GitHub API 限流。
    home-manager = {
      url = "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, niri-config, home-manager }:
    let
      system = "x86_64-linux";
      # 各主机共享的 extra specialArgs（如 niri-config flake）。
      baseSpecialArgs = { inherit niri-config; };
    in
    {
      nixosConfigurations = {
        # 物理机：NVIDIA GTX 1050 Ti。
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = baseSpecialArgs // { host = "laptop"; };
          modules = [
            ./hosts/laptop
            home-manager.nixosModules.home-manager
          ];
        };

        # VMware 虚拟机。
        vmware = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = baseSpecialArgs // { host = "vmware"; };
          modules = [
            ./hosts/vmware
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
