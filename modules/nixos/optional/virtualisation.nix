{
  virtualisation = {
    libvirtd = {
      enable = true;
      onShutdown = "shutdown";
      qemu.ovmf.enable = true;
    };
    waydroid.enable = false;
  };
  programs.virt-manager.enable = false;
}
