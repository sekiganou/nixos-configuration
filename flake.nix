{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = {
      laptop-asus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop-asus/configuration.nix
          ./modules/system/base.nix
          ./modules/locale/italy.nix
          ./modules/audio/pipewire.nix
          ./modules/desktop/plasma6.nix
          ./modules/dev/common.nix
          ./modules/users/alessio.nix
          ./modules/tailscale/tailscale.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      desktop-lenovo = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop-lenovo/configuration.nix
          ./modules/system/base.nix
          ./modules/locale/italy.nix
          ./modules/audio/pipewire.nix
          ./modules/desktop/plasma6.nix
          ./modules/dev/common.nix
          ./modules/users/alessio.nix
          ./modules/tailscale/tailscale.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    }; 
  };
}
