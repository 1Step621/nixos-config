{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        origin = "top-right";
        monitor = "0";
        alignment = "left";
        vertical_alignment = "center";
        width = "400";
        height = "(0,400)";
        scale = 0;
        gap_size = 8;
        progress_bar = true;
        transparency = 0;
        text_icon_padding = 0;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = false;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        corner_radius = 10;
        follow = "mouse";
        font = "Noto Sans CJK JP 10";
        format = "<b>%s</b>\\n%b";
        frame_color = "#3e4451";
        frame_width = 1;
        offset = "(15,15)";
        horizontal_padding = 10;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 64;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 10;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "yes";
        shrink = "no";
        word_wrap = "yes";
        browser = "/usr/bin/env zen-beta -new-tab";
      };
      fullscreen_delay_everything = {
        fullscreen = "delay";
      };
      urgency_critical = {
        background = "#282c34";
        foreground = "#e06c75";
        frame_color = "#e06c75";
      };
      urgency_low = {
        background = "#282c34";
        foreground = "#98c379";
        frame_color = "#3e4451";
      };
      urgency_normal = {
        background = "#282c34";
        foreground = "#abb2bf";
        frame_color = "#3e4451";
      };
    };
  };
}
