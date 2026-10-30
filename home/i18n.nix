{ pkgs, ... }:
{
i18n.inputMethod = {
  enable = true;
  type = "fcitx5";
  fcitx5 = {
    # 1. 顶层 addons：负责安装输入法引擎包
    addons = with pkgs; [
      qt6Packages.fcitx5-chinese-addons # 修正后的包名
      fcitx5-mozc
      fcitx5-gtk
      kdePackages.fcitx5-configtool
    ];

    # 2. settings 下包含两个并列的部分
    settings = {
      # 2.1 输入法列表
      inputMethod = {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us";
        };
        "Groups/0/Items/0".Name = "keyboard-us"; # 英文
        "Groups/0/Items/1".Name = "pinyin";      # 中文（双拼）
        "Groups/0/Items/2".Name = "mozc";        # 日文
      };

      # 2.2 插件配置（注意：addons 与上面的 inputMethod 是平级的）
      addons.pinyin.globalSection = {
        ShuangpinProfile = "Ziranma"; # 自然码
        ShowShuangpinMode = true;
      };
    };
  };
};
}
