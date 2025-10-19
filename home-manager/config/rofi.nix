{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    terminal = "/home/vaelixd/.nix-profile/bin/kitty";
    theme = "/home/vaelixd/.config/rofi/theme.rasi";

    extraConfig = {
      show-icons = true;
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = false;

      display-drun = "   Run  ";
      drun-display-format = "{icon} {name}";
      modi = "drun";

      location = 0;
    };
  };
}
