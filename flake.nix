{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = {
    self,
    nixpkgs,
    nix-flatpak,
    ...
  } @ inputs: {
    nixosConfigurations = {
      laptop-asus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop-asus/configuration.nix
          ./modules/system-bundle.nix
          inputs.home-manager.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      desktop-lenovo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop-lenovo/configuration.nix
          ./modules/system-bundle.nix
          inputs.home-manager.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
  };
}
