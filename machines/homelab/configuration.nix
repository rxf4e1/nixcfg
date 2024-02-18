{
  inputs,
  outputs,
  pkgs,
  ...
}:
let
  username = "toor";
in {
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    outputs.nixosModules.fonts
    outputs.nixosModules.locale
    outputs.nixosModules.nix
    outputs.nixosModules.xdg
    outputs.nixosModules.firewall
    outputs.nixosModules.syncthing

    # Or modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    # ./disko-config.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    curl
    gitFull
    wget
    tmux
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
        #   hi = final.hello.overrideAttrs (oldAttrs: {
          #     patches = [ ./change-hello-to-hi.patch ];
          #   });
          # })
    ];
    # Configure your nixpkgs instance
    config.allowUnfree = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["bcachefs"];
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_background_ratio" = 1;
      "vm.max_map_count" = 1048576;
    };
    readOnlyNixStore = true;
    tmp.useTmpfs = true;
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      systemd-boot.consoleMode = "auto";
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
    # initrd.systemd.enable = true;
    # kernelParams = ["quiet" "udev.log_level=3"];
    plymouth = {
      enable = false;
      # theme = "bgrt";
    };
  };

  networking = {
    hostId = "d34db33f";
    hostName = "homelab";
    nameservers = ["9.9.9.9" "149.112.112.112"];
    wireless.iwd = {
      enable = true;
      settings = {
        General.EnableNetworkConfiguration = true;
        Network.NameResolvingService = "systemd";
      };
    };
  };

  security = {
    rtkit.enable = true;
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ username ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
    # Extra security
    protectKernelImage = true;
  };

  programs.dconf.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
    };
  };

  users = {
    users.${username} = {
      isNormalUser = true;
      shell = pkgs.bash;
      extraGroups = [ "wheel" ];
    };
  };

  system.stateVersion = "24.05";
}
