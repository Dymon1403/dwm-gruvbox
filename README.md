# dwm-gruvbox
simply .h dwm configuration for your family.

This is so simple DWM dots that you will hardly find something easier lol

What it will look like:
![Desktop Preview](screenshots/2026-08-29_12-27.png)


and this like:
![Desktop Preview](screenshots/2026-08-29_12-28.png)


**How to run:**
Clone repo and replace my repo in ur dwm/

Add exec dwm in your ~/.xinitrc and launch X11:
```bash
startx
```
## Requirements

### Build Dependencies
To compile `dwm`, you need `make`, `gcc`, `pkg-config`, and the Xlib header files:

Arch Linux:
```bash
sudo pacman -S --needed base-devel libx11 libxft libxinerama fontconfig

```

Debian / Ubuntu:
```bash
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfontconfig1-dev

```

Recommended Runtime Software

    Terminal: alacritty
    Launcher: dmenu

# Notes
To run dwm, it is recommended to use xinit / startx.

P.S. Used on ThinkPad T430



