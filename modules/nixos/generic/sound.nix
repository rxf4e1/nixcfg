{
  sound.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
