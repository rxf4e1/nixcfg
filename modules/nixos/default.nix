{
  # Generic Stuff
  boot = import ./generic/boot.nix;
  fonts = import ./generic/fonts.nix;
  locale = import ./generic/locale.nix;
  nix = import ./generic/nix.nix;
  sound = import ./generic/sound.nix;
  xdg = import ./generic/xdg.nix;

  # Optional Stuff
  bluetooth = import ./optional/bluetooth.nix;
  greetd = import ./optional/greetd.nix;
  kde = import ./optional/kde.nix;
  tor = import ./optional/tor.nix;
  virtualisation = import ./optional/virtualisation.nix;
  
  # Server Stuff
  acme = import ./server/acme.nix;
  firewall = import ./server/firewall.nix;
  nginx = import ./server/nginx.nix;
  nitter = import ./server/nitter.nix;
  syncthing = import ./server/syncthing.nix;
}
