#!/usr/bin/env bash
# 蓝牙状态显示 / 开关
# 左键切换开关，右键打开 blueman-manager

ICON_OFF="󰂲"
ICON_ON="󰂯"
ICON_CONNECTED="󰂱"

toggle() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
}

case "$1" in
    --toggle)
        toggle
        exit 0
        ;;
esac

if ! command -v bluetoothctl >/dev/null 2>&1; then
    printf '{"text":"%s","class":"disabled","tooltip":"未安装 bluez"}\n' "$ICON_OFF"
    exit 0
fi

if ! bluetoothctl show | grep -q "Powered: yes"; then
    printf '{"text":"%s","class":"off","tooltip":"蓝牙已关闭 (左键开启)"}\n' "$ICON_OFF"
    exit 0
fi

connected=$(bluetoothctl devices Connected | cut -d' ' -f3- | paste -sd'、' -)
if [ -n "$connected" ]; then
    printf '{"text":"%s","class":"connected","tooltip":"蓝牙已连接: %s"}\n' "$ICON_CONNECTED" "$connected"
else
    printf '{"text":"%s","class":"on","tooltip":"蓝牙已开启, 未连接设备"}\n' "$ICON_ON"
fi
