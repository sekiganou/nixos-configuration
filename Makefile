MACHINE=$1
NIXOS_CONFIG = ./${MACHINE}
FLAKE = --flake ${NIXOS_CONFIG}

switch:
	sudo nixos-rebuild switch ${FLAKE}

test:
	echo "Using machine: ${MACHINE}"
	sudo nixos-rebuild test ${FLAKE}

update:
	nix flake update
	sudo nix-channel --update
	sudo nixos-rebuild switch ${FLAKE}

regenerate-hardware-configuration:
	sudo nixos-generate-config --dir ..
	sudo mv ../hardware-configuration.nix ./hosts/${MACHINE}
	sudo rm ../configuration.nix

prune:
	sudo nix-collect-garbage -d
