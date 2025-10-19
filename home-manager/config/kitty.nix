{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
        font_family = "CaskaydiaCove Nerd Font Mono";

        font_size = 12.0;
        window_padding_width = 20;

        close_on_child_death = true;

        enable_audio_bell = false;

        include = "~/.local/state/caelestia/theme/kitty.conf";
      };
  };
}
