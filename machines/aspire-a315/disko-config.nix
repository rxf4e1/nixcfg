{ disks ? [ "/dev/nvme0n1" "/dev/sda1" ]
, ... }: {
  disko.devices = {
    disk.nvme0n1 = {
      device = builtins.elemAt disks 0;
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            end = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot/efi";
            };
          };
          
          root = {
            name = "rootfs";
            end = "-0";
            content = {
              type = "filesystem";
              format = "bcachefs";
              "rootfs" = {
                mountpoint = "/";
                mountOptions = [ "compression=lz4" ];
              };
              subvolumes = {
                "/home".mountpoint = "/home";
                "/nix".mountpoint = "/nix";
                "/persist".mountpoint = "/persist";
                "/var".mountpoint = "/var";
              };
            };
          };
          
        };
      };
    };
    
    disk.sda = {
      device = builtins.elemAt disks 1;
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          data = {
            name = "datafs";
            size = "100%";
            content = {
              type = "filesystem";
              format = "bcachefs";
              mountpoint = "/persist/data";
              mountOptions = [ "compression=lz4" ];
            };
          };
        };
      };
    };
    
  };
}
