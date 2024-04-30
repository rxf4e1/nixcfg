{ inputs, outputs, pkgs, ... }: {
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    outputs.nixosModules.fonts
    outputs.nixosModules.locale
    outputs.nixosModules.nix
    outputs.nixosModules.sound
    outputs.nixosModules.xdg

    outputs.nixosModules.bluetooth
    # outputs.nixosModules.virtualisation
    # outputs.nixosModules.firewall
    # outputs.nixosModules.syncthing

    # Or modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    # You can also split up your configuration and import pieces of it here:
    ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    # ./disko-config.nix {
    #   _module.args.disk = [
    #     "/dev/disk/by-path/pci-0000:02:00.0-nvme-1"
    #     "/dev/disk/by-path/pci-0000:06:00.0-ata-1"
    #   ];
    # }
    ./hardware.nix
  ];

  environment.systemPackages = [ 
    pkgs.age 
    pkgs.brightnessctl 
    pkgs.dash
    pkgs.gitFull
    pkgs.home-manager 
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
    config.input-fonts.acceptLicense = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "bcachefs" ];
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
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
    # initrd.systemd.enable = true;
    kernelParams = [];
    plymouth = {
      enable = false;
      theme = "breeze";
    };
  };

  networking = {
    hostId = "d34db33f";
    hostName = "aspire-a315";
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
          users = ["user"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
    # Extra security
    protectKernelImage = true;
  };

  programs.adb.enable = true;
  programs.dconf.enable = true;
  # programs.zsh.enable = true;
  programs.nix-ld = {
      enable = true;
      # libraries = with pkgs; [];
    };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
  services.udev.packages = [ pkgs.android-udev-rules ];

  hardware.opengl.enable = true;
  hardware.openrazer.enable = true;

  system.stateVersion = "24.05";
}
