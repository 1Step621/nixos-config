{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "1Step621";
        email = "onestep621@gmail.com";
      };
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
    };
    attributes = [
      "* merge=mergiraf"
    ];
  };
}
