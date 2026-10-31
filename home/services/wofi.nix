# wofi 配置：home-manager 管理。
# 生成 ~/.config/wofi/config 与 ~/.config/wofi/style.css。
{ ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";
      prompt = "Search...";
      width = 600;
      height = 400;
      location = "center";
      allow_images = true;
      allow_markup = true;
      no_actions = true;
      term = "kitty";
    };

    style = ''
      * {
        font-family: "monospace";
        font-size: 14px;
      }

      window {
        background-color: rgba(40, 40, 40, 0.9);
        border: 2px solid #d79921;
        border-radius: 8px;
      }

      #input {
        background-color: transparent;
        color: #ebdbb2;
        padding: 8px;
      }

      #entry {
        padding: 6px 8px;
        color: #ebdbb2;
      }

      #entry:selected {
        background-color: #d79921;
        color: #282828;
      }
    '';
  };
}
