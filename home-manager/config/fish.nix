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
      alias ls="eza -1 --icons=auto --sort=name --group-directories-first"
      alias lal="eza -lh --icons=auto --sort=name --group-directories-first"
      alias tree="eza --tree --icons=auto --sort=name"
      alias hm="home-manager"
      alias cat="bat"

      zoxide init fish | source
      fzf --fish \
          --style full \
          --preview "fzf-preview.sh {}" \
          --bind "focus:transform-header:file --brief {}" \
          | source
    '';
  };
}
