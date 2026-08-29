#!/bin/bash

# Файл, где хранится имя текущей темы
STATE_FILE="$HOME/.config/current_theme"

# Читаем текущую тему (если файла нет — по дефолту dark)
if [ ! -f "$STATE_FILE" ]; then
    echo "dark" > "$STATE_FILE"
    CURRENT_THEME="dark"
else
    CURRENT_THEME=$(cat "$STATE_FILE")
fi

# Переключаем состояние
if [ "$CURRENT_THEME" = "dark" ]; then
    NEXT_THEME="light"
    XRES_FILE="$HOME/.config/x11/Xresources.light"
    ALACRITTY_THEME="$HOME/.config/alacritty/light.toml"
else
    NEXT_THEME="dark"
    XRES_FILE="$HOME/.config/x11/Xresources.dark"
    ALACRITTY_THEME="$HOME/.config/alacritty/dark.toml"
fi

# Записываем новое состояние
echo "$NEXT_THEME" > "$STATE_FILE"

# Применяем ресурсы X11 через перезапись (load), а не merge
if [ -f "$XRES_FILE" ]; then
    xrdb -load "$XRES_FILE"
else
    echo "Ошибка: не найден файл $XRES_FILE"
fi

# Переключаем тему Alacritty
if [ -f "$ALACRITTY_THEME" ]; then
    ln -sf "$ALACRITTY_THEME" "$HOME/.config/alacritty/theme.toml"
fi
