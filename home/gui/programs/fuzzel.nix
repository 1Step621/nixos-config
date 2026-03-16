{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Inter:size=10";
        line-height = 15;
      };
      colors = {
        background = "282a36dd";
        text = "f8f8f2ff";
        match = "8be9fdff";
        selection-match = "8be9fdff";
        selection = "44475add";
        selection-text = "f8f8f2ff";
        border = "bd93f9ff";
      };
      key-bindings = {
        delete-line-forward = "none";
        prev = "Up Control+k";
        next = "Down Control+j";
      };
    };
  };
}
