# waybar 配置：home-manager 管理。
# 生成 ~/.config/waybar/config 与 ~/.config/waybar/style.css，并链接 scripts/。
{ ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 6;
        "margin-top" = 6;
        "margin-left" = 8;
        "margin-right" = 8;

        "modules-left" = [ "custom/apps" "custom/bluetooth" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [ "custom/usb" "network" "memory" "pulseaudio" "custom/power" ];

        # 程序选择栏 (启动器)
        "custom/apps" = {
          format = "󰀻";
          tooltip = "Application Launcher";
          "on-click" = "wofi --show drun";
        };

        # 蓝牙
        "custom/bluetooth" = {
          exec = "~/.config/waybar/scripts/bluetooth.sh";
          "return-type" = "json";
          interval = 15;
          format = "{}";
          "on-click" = "~/.config/waybar/scripts/bluetooth.sh --toggle";
          "on-click-right" = "blueman-manager";
        };

        # U 盘 / 可移动设备
        "custom/usb" = {
          exec = "~/.config/waybar/scripts/usb.sh";
          "return-type" = "json";
          interval = 10;
          format = "{}";
          "on-click" = "~/.config/waybar/scripts/usb.sh --menu";
        };

        # 网络
        network = {
          "format-wifi" = "󰤨  {essid} ({signalStrength}%)";
          "format-ethernet" = "󰈀  Wire Connetion";
          "format-disconnected" = "󰤭  Inactivated";
          "tooltip-format" = "eth {ifname}";
          "on-click" = "nm-connection-editor";
        };

        # 内存
        memory = {
          interval = 5;
          format = "󰍛  {used:0.1f}/{total:0.1f} GiB";
          "tooltip-format" = "Momery Usage {percentage}%";
        };

        # 日期时间
        clock = {
          format = "󰥔  {:%H:%M}";
          "format-alt" = "󰃭  {:%Y-%m-%d %A}";
          "tooltip-format" = "<tt>{calendar}</tt>";
        };

        # 音频
        pulseaudio = {
          format = "{icon}  {volume}%";
          "format-muted" = "󰝟  Quite";
          "format-icons" = {
            headphone = "󰋋";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          "scroll-step" = 5;
          "on-click" = "pavucontrol";
        };

        # 开关机 (电源菜单)
        "custom/power" = {
          format = "⏻";
          tooltip = "Power Menu";
          "on-click" = "~/.config/waybar/scripts/power.sh";
        };
      };
    };

    style = ./waybar/style.css;

    # 注意：niri 已通过 config.kdl 的 spawn-at-startup "waybar" 启动，
    # 因此这里不启用 systemd，避免重复启动。
  };

  xdg.configFile = {
    "waybar/scripts/bluetooth.sh" = {
      source = ./waybar/scripts/bluetooth.sh;
      executable = true;
    };
    "waybar/scripts/power.sh" = {
      source = ./waybar/scripts/power.sh;
      executable = true;
    };
    "waybar/scripts/usb.sh" = {
      source = ./waybar/scripts/usb.sh;
      executable = true;
    };
  };
}
