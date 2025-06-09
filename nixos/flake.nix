{
  description = "Nixos config flake";

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    mcmojave-hyprcursor.url = "github:libadoxon/mcmojave-hyprcursor";
  };

  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
