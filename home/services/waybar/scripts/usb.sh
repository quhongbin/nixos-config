#!/usr/bin/env bash
# U 盘 / 可移动设备检测
# 点击弹出菜单选择并打开已挂载的 USB 设备

ICON_USB="󰕓"

mounted_usb() {
    lsblk -rno NAME,TRAN,MOUNTPOINT 2>/dev/null | awk '$2 == "usb" && $4 != "" {print $4}'
}

case "$1" in
    --menu)
        mapfile -t mps < <(mounted_usb)
        if [ "${#mps[@]}" -eq 0 ]; then
            notify-send "USB" "未检测到已挂载的 USB 设备" 2>/dev/null
            exit 0
        fi
        if command -v wofi >/dev/null 2>&1; then
            chosen=$(printf '%s\n' "${mps[@]}" | wofi --dmenu --prompt "打开 USB 设备")
        elif command -v rofi >/dev/null 2>&1; then
            chosen=$(printf '%s\n' "${mps[@]}" | rofi -dmenu -p "打开 USB 设备")
        fi
        [ -n "$chosen" ] && xdg-open "$chosen"
        exit 0
        ;;
esac

mapfile -t mps < <(mounted_usb)
if [ "${#mps[@]}" -eq 0 ]; then
    printf '{"text":"%s","class":"none","tooltip":"未检测到 USB 设备"}\n' "$ICON_USB"
else
    count="${#mps[@]}"
    list=$(printf '%s\n' "${mps[@]}" | paste -sd'、' -)
    printf '{"text":"%s  %d","class":"present","tooltip":"USB 已挂载 (%d): %s"}\n' "$ICON_USB" "$count" "$count" "$list"
fi
