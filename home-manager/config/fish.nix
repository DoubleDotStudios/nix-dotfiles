{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      nitch
      set fish_greeting
    '';

    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];

    shellInit = ''
      alias cd="z"
      alias c="clear"
      alias v="nvim"
      alias df="duf -hide special"

      zoxide init fish | source
      fzf --fish \
          --style full \
          --preview "fzf-preview.sh {}" \
          --bind "focus:transform-header:file --brief {}" \
          | source
    '';
  };
}
