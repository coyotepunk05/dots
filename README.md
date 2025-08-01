
![2024-12-02_18-21-47](https://github.com/user-attachments/assets/f23dc60a-cd08-4ec3-87f4-ded62490a13e)

<br />
<br />
<br />

```
██████╗ ██╗   ██╗██╗    ██╗ █████╗ ██╗     
██╔══██╗╚██╗ ██╔╝██║    ██║██╔══██╗██║     
██████╔╝ ╚████╔╝ ██║ █╗ ██║███████║██║     
██╔═══╝   ╚██╔╝  ██║███╗██║██╔══██║██║     
██║        ██║   ╚███╔███╔╝██║  ██║███████╗
╚═╝        ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝

Integrated with many common applications
```


https://github.com/user-attachments/assets/c6d34459-28b6-4e13-9cfa-31e37ea4eb71



<br />
<br />
<br />

```
██╗    ██╗ █████╗ ██╗   ██╗██████╗  █████╗ ██████╗ 
██║    ██║██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
██║ █╗ ██║███████║ ╚████╔╝ ██████╔╝███████║██████╔╝
██║███╗██║██╔══██║  ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
╚███╔███╔╝██║  ██║   ██║   ██████╔╝██║  ██║██║  ██║
 ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
                                                   
Usable setup with dropdown menus for audio EQ, audio output, internet, system metrics, and bluetooth.
```

https://github.com/user-attachments/assets/c1081157-243f-4c1a-96a8-88749bc675c7


<br />
<br />
<br />

**Binds:**

```
Kitty:..............................Super+Q
Wofi:...............................Super+R
Thunar:.............................Super+E
Obsidian............................Super+O
Toggle Waybar:......................Super+W
Exit:...............................Super+C
Toggle Fullscreen:..................Super+F
Toggle Floating.....................Super+G
Toggle Split........................Super+S
Wlogout:............................Super+L
Wayland-Logout:.....................Super+M
Switch Wallpaper:...................Super+X
Wallpaper Switching GUI.............Super+Z
Screenshot:.........................Super+Shift+S
Pick Color:.........................Super+Alt+Shift+S
Switch to [X] Workspace:............Super+[X]
Send Application to [X] Workspace:..Super+Shift+[X]
View and Switch Apps:...............Alt+Tab
```

<br />
<br />

**Required packages, and what I use:**

<br />
All my applications (mostly for my reference):

```
yay -S plymouth gamescope socat qbittorrent bc libreoffice cowsay gimp fcitx5-mozc fcitx5-configtool fcitx5-gtk ufw ark archlinux-xdg-menu mullvad-vin-bin nodejs-nativefier fish hyprswitch gnome-themes-extra graphite-gtk-theme-black-git btop wipeclean pywal-discord-git pamixer firefox neovim pacman-contrib reflector waybar python-pywal16 wofi rofi-wayland rofi-calc swappy grim slurp hyprpicker wl-clipboard thunar gvfs thunar-archive-plugin file-roller stow swaync github-cli filelight mission-center lxtask p7zip wlogout phoronix-test-suite hyprlock hypridle wayland-logout xdg-desktop-portal-hyprland powertop auto-cpufreq tlp alsa-utils pavucontrol brightnessctl bluez bluez-utils blueman network-manager-applet ttf-jetbrains-mono-nerd ttf-roboto-mono noto-fonts-emoji noto-fonts noto-fonts-cjk noto-fonts-extra ttf-font-awesome python-pywalfox nwg-look swww cava jp2a w3m spicetify-cli oh-my-bash-git blesh-git starship fastfetch rose-pine-cursor rose-pine-hyprcursor vesktop spotify visual-studio-code-bin steam yazi jamesdsp obsidian kservice5 kvantum-git kvantum-qt5 dolphin hyprsunset howdy-git linux-enable-ir-emitter-5.2.4 linux-headers dkms xpadneo-dkms webkit2gtk libcef winetricks hyprpolkitagent man waypaper wdpass ntfs-3g ckb-next kdiskmark
```
plugins being used:
hyprspace
hyprsplit

Only packages required for customization (I am worse at updating these):

```
yay -S pywal-discord-git neovim waybar python-pywal16 wofi swappy grim slurp hyprpicker wl-clipboard stow swaync wlogout hyprlock hypridle wayland-logout pavucontrol brightnessctl bluez bluez-utils blueman network-manager-applet ttf-jetbrains-mono-nerd ttf-roboto-mono noto-fonts-emoji noto-fonts noto-fonts-cjk noto-fonts-extra ttf-font-awesome python-pywalfox nwg-look swww spicetify-cli blesh-git starship oh-my-bash-git fastfetch rose-pine-cursor rose-pine-hyprcursor jamesdsp
```

Some of these programs take a while to install. Make sure that pacman is allowed to use as many cores as possible.

Installing Plymouth:
/etc/mkinitcpio.conf
add 'plymouth' after udev in HOOKS
sudo mkinitcpio -p linux

/etc/default/grub
add 'splash rd.udev.log_priority=3 vt.global_cursor_default=0' after 'quiet'
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo plymouth-set-default-theme -l // -R bgrt
