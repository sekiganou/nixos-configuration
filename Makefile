NIXOS_CONFIG=/etc/nixos
FLAKE=--flake /etc/nixos/#nixos
FILES=home.nix auth.key flake.nix configuration.nix

switch:
	sudo cp ${FILES} ${NIXOS_CONFIG}
	sudo nixos-rebuild switch $(FLAKE)

test:
	sudo cp ${FILES} ${NIXOS_CONFIG}
	sudo nixos-rebuild test $(FLAKE)

update:
	cd ${NIXOS_CONFIG}
	nix flake update
	sudo nix-channel --update
	sudo nixos-rebuild switch $(FLAKE)

# TODO: define prune target to remove old generations