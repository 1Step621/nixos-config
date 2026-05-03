{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "catppuccin-icons"
      "git-firefly"
      "html"
      "haskell"
      "java-eclipse-jdtls"
      "nix"
      "svelte"
      "toml"
      "typst"
      "base16"
    ];
    mutableUserDebug = false;
    mutableUserSettings = false;
    mutableUserTasks = false;
    userSettings = {
      outline_panel.button = false;
      collaboration_panel.button = false;
      debugger.button = false;
      edit_predictions.provider = "copilot";
      agent = {
        button = false;
        default_model = {
          provider = "copilot_chat";
          model = "gpt-5.2-codex";
          enable_thinking = true;
          effort = "high";
        };
      };
      git.inline_blame.enabled = false;
      icon_theme = "Catppuccin Frappé";
      ui_font_family = "Inter";
      session.trust_all_worktrees = true;
      cli_default_open_behavior = "new_window";
      git_panel = {
        tree_view = true;
        dock = "right";
      };
      project_panel.dock = "left";
      terminal = {
        dock = "bottom";
        cursor_shape = "bar";
        line_height = "comfortable";
        minimum_contrast = 0;
      };
      sticky_scroll.enabled = false;
      scroll_sensitivity = 3;
      minimap.show = "never";
      current_line_highlight = "all";
      cursor_blink = true;
      buffer_font_fallbacks = [
        "NotoMono Nerd Font Mono"
        "Noto Sans CJK JP"
      ];
      buffer_font_family = "Roboto Mono";
      file_types = {
        cpp = [
          "*.hpp"
        ];
      };
      linked_edits = true;
      show_edit_predictions = true;
      ensure_final_newline_on_save = true;
      tab_size = 2;
      base_keymap = "VSCode";
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "system";
        light = "One Light";
        dark = "Base16 OneDark";
      };
      load_direnv = "shell_hook";
      lsp = {
        clangd.binary.arguments = [
          "--header-insertion=never"
        ];
        tinymist.settings = {
          exportPdf = "onSave";
          outputPath = "$root/$name";
        };
      };
      languages = {
        Rust = {
          tab_size = 4;
          hard_tabs = false;
        };
        "C++" = {
          tab_size = 4;
          hard_tabs = false;
        };
      };
    };
  };
}
