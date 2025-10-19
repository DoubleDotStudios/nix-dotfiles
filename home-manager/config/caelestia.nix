{ config, pkgs, ... }:

{
  programs.caelestia = {
    enable = true;
    systemd.enable = false;

    cli = {
      enable = true;
      settings = {
       theme = {
          enableHypr = false;
          enableTerm = false;
        };
      };
    };

    settings = {
      appearance = {
        font.size.scale = 0.8;
        padding.scale = 0.8;
        rounding.scale = 0.8;
        scaling.scale = 0.8;
      };

      session = {
        commands.logout = ["hyprctl" "dispatch" "exit"];
      };
    };
  };
}
