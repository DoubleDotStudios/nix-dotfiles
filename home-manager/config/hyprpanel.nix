{ config, pkgs, ... }:

{
  programs.hyprpanel = {
    enable = false;

    settings = {
      bar.layouts = {
        "0" = {
          left = ["dashboard" "cpu" "cputemp" "ram" "media"];
          middle = ["workspaces"];
          right = ["systray" "notifications" "network" "bluetooth" "battery" "volume" "clock"];
        };
      };

      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;
      bar.clock.format = "%H:%M %p";

      bar.bluetooth.label = false;
      bar.network.label = false;
      bar.battery.label = true;
      bar.volume.label = true;

      bar.clock.icon = false;

      menus.clock = {
        time = {
          military = false;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard = {
        directories = {
          enabled = false;
        };

        stats = {
          enableGpu = false;
        };
      };

      theme.bar.transparent = true;

      theme.font = {
        name = "CaskaydiaCove Nerd Font Mono";
        size = "11px";
      };
    };
  };
}
