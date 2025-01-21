{
  outputs = { self }: {
    templates = {
      default-dev = {
        path = ./templates/default-dev;
        description = "A getting started flake for a new project.";
      };
      default = self.templates.default-dev;
      hugo-dev = {
        path = ./templates/hugo-dev;
        description = "A getting started flake for a new static website project with hugo.";
      };
      rust-dev = {
        path = ./templates/rust-dev;
        description = "A getting started flake for a new Rust project.";
      };
      python-dev = {
        path = ./templates/python-dev;
        description = "A getting started flake for a new Python project.";
      };
    };
  };
}