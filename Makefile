NIXOS_CONFIG = .
FLAKE = --flake ${NIXOS_CONFIG}

switch:
	sudo nixos-rebuild switch ${FLAKE}

test:
	sudo nixos-rebuild test ${FLAKE}

update:
	cd ${NIXOS_CONFIG} && nix flake update
	sudo nix-channel --update
	sudo nixos-rebuild switch ${FLAKE}

regenerate-hardware-configuration:
	sudo nixos-generate-config --dir ..
	sudo cp ../hardware-configuration.nix .
	sudo rm ../configuration.nix

prune:
	sudo nix-collect-garbage -d
