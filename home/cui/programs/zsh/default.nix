{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = ".p10k.zsh";
      }
    ];

    zsh-abbr = {
      enable = true;
      abbreviations = {
        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
        lla = "eza -la";
        rm = "rm -rf";
        cp = "cp -r";
        c = "clear";
        lg = "lazygit";
        rusti = "evcxr";
        drg = "dragon-drop";
        open = "xdg-open";
        code = "zeditor";
        zed = "zeditor";
        "ちぇん" = "cd";
        "チェン" = "cd";
      };
    };

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      export _ZO_EXCLUDE_DIRS="$HOME:/nix/store/*:$HOME/.*"
      eval "$(zoxide init zsh --cmd cd)"

      bindkey '^ ' forward-word

      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      zoxide_zi_insert() {
        local dir
        dir="$(zoxide query -i)" || return
        zle -U "$dir"
        zle reset-prompt
      }

      zle -N zoxide_zi_insert
      bindkey '^G' zoxide_zi_insert

      setopt interactivecomments
    '';
  };
}
