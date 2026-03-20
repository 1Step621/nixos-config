{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Inter:size=10";
        line-height = 17;
        image-size-ratio = 1;
        prompt = "\"\"";
        inner-pad = 10;
        lines = 5;
      };
      colors = {
        background = "282c34dd";
        text = "abb2bfff";
        match = "61afefff";
        selection-match = "61afefff";
        selection = "3e4451dd";
        selection-text = "abb2bfff";
        border = "61afefff";
      };
      border = {
        selection-radius = 8;
      };
      key-bindings = {
        delete-line-forward = "none";
        prev = "Up Control+k";
        next = "Down Control+j";
      };
    };
  };
}
