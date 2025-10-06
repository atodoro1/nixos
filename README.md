# My NixOS Config

Personal NixOS setup managed as a Nix flake, with system config.

## Structure

- `flake.nix`: Main configuration.
- `hosts/`: Host-specific settings (e.g., `hp/`).
- `nixosModules/`: Custom NixOS modules.

## Usage

1. Clone repo to `/etc/nixos`:

```bash
git clone https://github.com/atodoro1/nixos.git /etc/nixos
cd /etc/nixos
```

2. Rebuild system for my hp host:

```bash
sudo nixos-rebuild switch --flake "/etc/nixos#nixos"
```
