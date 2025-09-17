.PHONY: check-host
check-host:
	@if [ -z "$(HOST)" ]; then \
		echo "Error: HOST is not set. Use 'make <target> HOST=your-hostname' or set it as an environment variable."; \
		exit 1; \
	fi

.PHONY: switch
switch: check-host
	sudo nixos-rebuild switch --flake ./#${HOST}

.PHONY: test
test: check-host
	sudo nixos-rebuild test --flake ./#${HOST}

.PHONY: update
update: check-host
	nix flake update
	sudo nix-channel --update
	sudo nixos-rebuild switch --flake ./#${HOST}

.PHONY: regenerate-hardware-configuration
regenerate-hardware-configuration: check-host
	sudo nixos-generate-config --dir ..
	sudo mv ../hardware-configuration.nix ./hosts/${HOST}
	sudo rm ../configuration.nix

.PHONY: prune
prune:
	sudo nix-collect-garbage -d --delete-older-than 10d

.PHONY: help
help:
	@echo "NixOS Management Makefile"
	@echo ""
	@echo "Usage: make <target> [HOST=hostname]"
	@echo ""
	@echo "Targets:"
	@echo "  switch                        - Switch to new configuration"
	@echo "  test                          - Test new configuration (temporary)"
	@echo "  update                        - Update flake and rebuild"
	@echo "  regenerate-hardware-configuration - Regenerate hardware config"
	@echo "  prune                         - Clean up old generations"
	@echo "  help                          - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make switch HOST=desktop"
	@echo "  make test HOST=laptop"
	@echo "  HOST=server make update"