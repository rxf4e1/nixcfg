{ config, pkgs, ... }: 
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = true;
  users.users.user = {
    isNormalUser = true;
    shell = pkgs.dash;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
    ] ++ ifTheyExist [
      "adbusers"
      "git"
      "kvm"
      "libvirtd"
      "qemu-libvirtd"
      "network"
      "openrazer"
      "wireshark"
    ];
  };
}
