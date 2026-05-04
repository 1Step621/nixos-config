{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull = {
        rebase = true;
        autostash = true;
      };
      rebase.autostash = true;
      credential = {
        helper = "cache";
        "https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
        "https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };
      gpg.program = "gpg";
      commit.gpgsign = true;
      merge.conflictstyle = "diff3";
      merge.mergiraf = {
        name = "mergiraf";
        driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
      };
      url."https://github.com/".insteadOf = [
        "gh:"
        "github:"
      ];
      alias.undo = "reset --soft HEAD^";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        dark = true;
      };
    };
    ignores = [
      ".direnv/"
    ];
    attributes = [
      "* merge=mergiraf"
    ];
  };
}
