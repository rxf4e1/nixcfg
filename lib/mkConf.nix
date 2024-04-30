{config, inputs, outputs, home-manager, nixpkgs, system, ...}:

let

  hostName = config.system.name;

  mkHome = userName: (
    let
      homeDirectory = "/home/${userName}";
      configHome = "${homeDirectory}/.config";

      pkgs = import nixpkgs {
        inherit system;
        config.xdg.configHome = configHome;
      };

      conf = (
        import ../machines/${hostName}/home.nix {
          inherit pkgs inputs outputs userName homeDirectory;
          inherit (pkgs) config lib stdenv;
        });
  
    in 
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs system userName homeDirectory;
        configuration = conf;
      });

in
{
  user = mkHome "user";
}



  ### https://discourse.nixos.org/t/get-hostname-in-home-manager-flake-for-host-dependent-user-configs/18859
