On Artix Linux, make sure you've enabled Arch repos!

# Install script
```
cd && git clone https://github.com/n3k0angel/dotfiles && cd dotfiles && chmod +x install.sh && ./install.sh
```

# Manual install
Groups to make stuff easier
```sh
$ sudo usermod -aG network,floppy,scanner,power,video,storage,optical,kvm,input,disk,audio $USER
```

Needed packages
```sh
$ sudo pacman -S --needed --noconfirm git base-devel man pipewire pipewire-pulse wireplumber neovim mpv hdparm bat powertop keepassxc feh fzf btop udisks2 dunst acpi brightnessctl slock pcmanfm-gtk3 xsel xdg-user-dirs chafa ffmpegthumbnailer
```

Paru
```sh
$ sudo pacman -S --needed base-devel git && git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && makepkg -si && paru --gendb && cd .. && sudo rm -rv paru-bin
```

AUR stuff
```sh
$ paru -S lf bashmount ctpv newsraft numlockx librewolf-bin brave-bin ungoogled-chromium-bin compfy invidtui-bin gpg-tui
```

Bash prompt
```sh
PS1="\[\e[38;5;153m\][\u\[\e[38;5;153m\]@\[\e[38;5;153m\]\h \[\e[38;5;214m\]\w\[\e[38;5;153m\]]\[\033[0m\]$ "
```

Thicker fonts:
```sh
/etc/environment
FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
```

Fonts (make sure you've logged out and back in at least once)
```sh
$ paru -S ttf-jetbrains-mono-nerd ttf-ms-win11-auto adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-emoji && paru -Rns gnu-free-fonts
```
