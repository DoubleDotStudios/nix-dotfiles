{ config, pkgs, ... }:

{
  imports = [
    ./config/bash.nix
    ./config/fish.nix
    ./config/kitty.nix
    ./config/rofi.nix
    ./config/caelestia.nix
    ./config/vicinae.nix
    ./config/hyprland.nix
  ];


  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vaelixd";
  home.homeDirectory = "/home/vaelixd";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zoxide
    fzf
    bat
    hyprpicker
    cava
    gpu-screen-recorder
    duf
    quickshell
    gh
    nitch
  ];

  programs.zoxide.enableFishIntegration = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
     ".config/caelestia/templates".source = misc/caelestia/templates;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}

