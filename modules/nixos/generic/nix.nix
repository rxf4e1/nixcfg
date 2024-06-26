{ config, inputs, lib, ... }:
{
  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;
  
  nix.settings = {
    experimental-features = "nix-command flakes repl-flake";
    auto-optimise-store = true;
    builders-use-substitutes = true;
    allowed-users = ["user"];
    trusted-users = ["root" "user"];
  };

}
