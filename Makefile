NIXOS_CONFIG = /etc/nixos
FLAKE = --flake ${NIXOS_CONFIG}#nixos

switch:
	sudo nixos-rebuild switch ${FLAKE}

test:
	sudo nixos-rebuild test ${FLAKE}

update:
	cd ${NIXOS_CONFIG} && nix flake update
	sudo nix-channel --update
	sudo nixos-rebuild switch ${FLAKE}

prune:
	sudo nix-collect-garbage -d
