Install Required Packages
```
sudo pacman -S hyprland hypridle hyprlock hyprpaper kitty btop fish nautilus xdg-desktop-portal-hyprland xdg-desktop-portal-gtk rofi-wayland waybar ttf-nerd-fonts-symbols wl-clipboard cliphist
```
Download The Apple Fonts From The AUR
```
paru -S apple-fonts
```
For Login Management, I Personally use greetd
```
sudo pacman -S greetd && sudo systemctl enable greetd
```
But If You want Sddm
```
sudo pacman -S sddm && sudo systemctl enable sddm
```
Install This Repo Using This Command
```
git clone --depth 1 https://github.com/DAnaselo/HyprDE
```
