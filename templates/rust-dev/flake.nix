{
  description = "A getting started flake for a new Rust project.";

  # Flake inputs
  # Use the current unstable Nixpkgs according to https://flakehub.com/flake/NixOS/nixpkgs?view=usage.
  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz";

  # Flake outputs
  outputs = { self, nixpkgs }:
    let
      # The systems supported for this flake
      supportedSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper to provide system-specific attributes
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          # The Nix packages provided in the environment
          # Add any you need here
          packages = with pkgs; [ rustup cargo-generate cargo-edit mdbook ];

          # Set any environment variables for your dev shell
          env = { RUST_BACKTRACE="1"; };

          # Add any shell logic you want executed any time the environment is activated
          shellHook = ''
          '';
        };
      });
    };
}