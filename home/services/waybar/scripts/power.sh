#!/usr/bin/env bash
# 电源菜单: 关机 / 重启 / 注销 / 锁屏 / 挂起

MENU=$(printf '%s\n' '关机' '重启' '注销' '锁定屏幕' '挂起' '取消')

if command -v wofi >/dev/null 2>&1; then
    chosen=$(echo "$MENU" | wofi --dmenu --prompt "电源菜单" --lines 6)
elif command -v rofi >/dev/null 2>&1; then
    chosen=$(echo "$MENU" | rofi -dmenu -p "电源菜单" -l 6)
else
    notify-send "错误" "请先安装 wofi 或 rofi" 2>/dev/null
    exit 1
fi

case "$chosen" in
    关机)
        systemctl poweroff
        ;;
    重启)
        systemctl reboot
        ;;
    注销)
        if command -v hyprctl >/dev/null 2>&1; then
            hyprctl dispatch exit
        elif command -v swaymsg >/dev/null 2>&1; then
            swaymsg exit
        else
            loginctl terminate-user "$USER"
        fi
        ;;
    锁定屏幕)
        if command -v hyprlock >/dev/null 2>&1; then
            hyprlock
        elif command -v swaylock >/dev/null 2>&1; then
            swaylock -f
        fi
        ;;
    挂起)
        systemctl suspend
        ;;
    *)
        exit 0
        ;;
esac
