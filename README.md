# dotfiles
groups to make stuff easier
```sh
sudo usermod -aG network,floppy,scanner,power,video,storage,optical,kvm,input,disk,audio $USER
```

```sh
sudo pacman -S --needed git base-devel man pipewire pipewire-pulse wireplumber neovim mpv hdparm bat powertop keepassxc feh fzf btop udisks2 dunst acpi brightnessctl slock pcmanfm-gtk3 ttf-jetbrains-mono-nerd
```
```sh
yay -S lf bashmount ctpv newsraft numlockx librewolf-bin brave-bin ungoogled-chromium-bin compfy invidtui-bin
```
bash prompt
```sh
PS1="\[\e[38;5;153m\][\u\[\e[38;5;153m\]@\[\e[38;5;153m\]\h \[\e[38;5;214m\]\w\[\e[38;5;153m\]]\[\033[0m\]$ "
```

thicker fonts:
```sh
/etc/environment
FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
```
make sure you've logged out and back in at least once 
```sh
yay -S ttf-ms-win11-auto adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts && yay -Rns gnu-free-fonts
```
