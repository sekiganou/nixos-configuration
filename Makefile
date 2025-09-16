switch:
	sudo cp configuration.nix /etc/nixos/configuration.nix
	sudo nixos-rebuild switch

test:
	sudo cp configuration.nix /etc/nixos/configuration.nix
	sudo nixos-rebuild test

update:
	cd /etc/nixos
	sudo nix-channel --update
	sudo nixos-rebuild switch