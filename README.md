# Development Flakes

This repository manages default "flake.nix" files for specific development environments, e.g., a Rust project.

Each specific flake sets the current unstable Nixpkgs from Flakehub as input and outputs a devShell. The "flake.nix" file creates the devShell according to the operating system and the to-be-specified packages and environment variables. It also lets you specify a shellHook that will be executed after nix loads the devShell.

## Requirements

You need

- `nix` installed with the experimental flake feature activated, e.g., via the [Determinate Systems installer](https://determinate.systems/nix-installer/).
- `direnv` which loads your flake when you `cd` into the directory. Activate it, e.g., via HomeManager: `programs.direnv.enable = true;`

## Usage

Use these templates when you initialise your project.
For example, when initializing a Rust project, open a command line and run

```sh
nix flake init --template "github:cybrmzrt/development-flakes#rust-dev"
```

This command opens a development shell with the corresponding needed packages and environment variables. Furthermore, the template loads a `.envrc` file telling `direnv` to use the flake to load environment variables.

## Available flakes

- default
- hugo-dev
- python-dev
- rust-dev

## License

See [LICENSE](./LICENCE).
