{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22000 8384];
    allowedUDPPorts = [ 22000 21027 ];
    allowPing = true;
  };
}
