{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$browser" = "librewolf";
      "$term" = "kitty";

      monitor = ", preferred, auto, 1.25";
      xwayland.force_zero_scaling = true;

      source = [
        "~/.local/state/caelestia/theme/hyprland.conf"
      ];

      exec-once = [
        "caelestia-shell"
      ];

      # exec = [
      #   "hyprctl dispatch submap global"
      # ];

      # submap = "global";

      bind = [
        # Applications
        "$mod, F, exec, $browser"
        "$mod, Return, exec, $term"

        # Rofi
        # "$mod, A, exec, rofi -show drun"
        # "ALT, Tab, exec, rofi -show window"

        # Environment
        # "$mod CTRL, B, exec, hyprpanel --quit || hyprpanel"
        "$mod, Q, killactive,"

        # Caelestia
        "CTRL ALT, Delete, global, caelestia:session"
        "$mod, A, global, caelestia:launcher"
        "$mod, K, global, caelestia:showall"
        "$mod, L, global, caelestia:lock"
        "$mod SHIFT, S, global, caelestia:screenshotFreeze"
        "$mod SHIFT ALT, S, global, caelestia:screenshot"
        "$mod, R, exec, gpu-screen-recorder -w portal -f 60 -ac opus -k h264 -a default_output -q high -cursor yes -cr limited -o ~/Videos/(date '+%d-%m-%Y_%R').mp4"
        "$mod SHIFT, R, exec, gpu-screen-recorder -w portal -restore-portal-session yes -f 60 -ac opus -k h264 -a default_output -q high -cursor yes -cr limited -o ~/Videos/(date '+%d-%m-%Y_%R').mp4"
        # "$mod ALT, R, exec, caelestia record -s"
        # "CTRL ALT, R, exec, caelestia record"
        # "$mod SHIFT ALT, R, exec, caelestia record -r"
        # "$mod SHIFT, C, exec, hyprpicker -a"
      ]
      ++(
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, ${toString ws}, workspace, ${toString ws}"
              "$mod ALT, ${toString ws}, movetoworkspace, ${toString ws}"
            ]
          )
        9)
      );

      bindin = [
        # "$mod, catchall, global, caelestia:launcherInterrupt"
        "$mod, mouse:272, global, caelestia:launcherInterrupt"
        "$mod, mouse:273, global, caelestia:launcherInterrupt"
        "$mod, mouse:274, global, caelestia:launcherInterrupt"
        "$mod, mouse:275, global, caelestia:launcherInterrupt"
        "$mod, mouse:276, global, caelestia:launcherInterrupt"
        "$mod, mouse:277, global, caelestia:launcherInterrupt"
        "$mod, mouse_up, global, caelestia:launcherInterrupt"
        "$mod, mouse_down, global, caelestia:launcherInterrupt"
      ];

      bindl = [
        ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
        ", XF86MonBrightnessDown, global, caelestia:brightnessDown"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mod SHIFT, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        "CTRL ALT, C, global, caelestia:clearNotifs"
        "$mod ALT, L, exec, caelestia shell -d"
        "$mod ALT, L, global, caelestia:lock"
        "$mod CTRL, Space, global, caelestia:mediaToggle"
        ", XF86AudioPlay, global, caelestia:mediaToggle"
        ", XF86AudioPause, global, caelestia:mediaToggle"
        "$mod CTRL, Equal, global, caelestia:mediaNext"
        ", XF86AudioNext, global, caelestia:mediaNext"
        "$mod CTRL, Minus, global, caelestia:mediaPrev"
        ", XF86AudioPrev, global, caelestia:mediaPrev"
        ", XF86AudioStop, global, caelestia:mediaStop"

        ", Print, exec, caelestia screenshot"
        "$mod, S, exec, caelestia screenshot"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindr = [
        "$mod CTRL SHIFT, R, exec, caelestia shell kill"
        "$mod CTRL ALT, R, exec, caelestia-shell -k; sleep 3s; caelestia-shell -d"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 12;

        border_size = 2;

        allow_tearing = false;

        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;

        active_opacity = 0.95;
        inactive_opacity = 0.8;

        shadow.enabled = false;

        blur = {
          enabled = true;

          size = 5;
          passes = 2;

          vibrancy = 0.1696;
        };
      };

      misc = {
        force_default_wallpaper = false;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        kb_model = "";
        kb_options = "caps:none, caps:return";
        kb_rules = "";

        repeat_delay = 400;
        repeat_rate = 25;

        follow_mouse = true;

        sensitivity = 0;

        special_fallthrough = true;
        focus_on_close = true;

        touchpad = {
          natural_scroll = false;
          disable_while_typing = false;
        };
      };
    };
  };
}
