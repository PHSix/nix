sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +2
nix-env --delete-generations +2
# rm /run/booted-system
nix-collect-garbage
