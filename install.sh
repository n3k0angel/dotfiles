#!/usr/bin/sh
set -e
set -o pipefail

if [ $EUID = 0 ]; then
    echo "Do not run as root!"
    exit
fi

GITDIR="/home/$USER/dotfiles"
CONFDIR="/home/$USER/.config/"
SSHDIR="/home/$USER/.ssh/"
LOCALBINDIR="/home/$USER/.local/bin/"

mkdir -p $CONFDIR
mkdir -p $SSHDIR
mkdir -p $LOCALBINDIR

# Add $USER to needed groups
sudo usermod -aG network,floppy,scanner,power,video,storage,optical,kvm,input,disk,audio $USER

# Install stuff
sudo pacman -S --needed --noconfirm git base-devel man pipewire pipewire-pulse wireplumber neovim mpv hdparm bat powertop keepassxc xwallpaper fzf btop udisks2 dunst acpi brightnessctl slock pcmanfm-gtk3 xsel xdg-user-dirs chafa ffmpegthumbnailer picom redshift

xdg-user-dirs-update

# Install paru
cd /home/$USER
sudo pacman -S --needed --noconfirm base-devel git 
git clone https://aur.archlinux.org/paru-bin.git 
cd paru-bin 
makepkg -si 
paru --gendb 
cd .. 
sudo rm -rv paru-bin

cd $GITDIR

# Install more stuff
paru -S --needed --noconfirm lf bashmount ctpv newsraft numlockx librewolf-bin brave-bin ungoogled-chromium-bin invidtui-bin gpg-tui

# Bash prompt
sed '/PS1/d' /home/$USER/.bashrc > /home/$USER/bashrc-temp
mv /home/$USER/bashrc-temp /home/$USER/.bashrc
echo 'PS1="\[\e[1;32m\][\u\[\e[1;32m\]@\[\e[1;32m\]\h \[\e[0;93m\]\w\[\e[1;32m\]]\[\033[0m\]$ "' >> /home/$USER/.bashrc
echo "EDITOR=nvim" >> /home/$USER/.bashrc
echo 'alias ls="ls -lah --color=always"' >> /home/$USER/.bashrc
echo 'alias bm="bashmount"' >> /home/$USER/.bashrc

# Thicker fonts
sudo chmod o+w /etc/environment
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' >> /etc/environment
sudo chmod o-w /etc/environment

# Install configs
cp -rv .config/* $CONFDIR/
cp -rv .ssh/* $SSHDIR/

# .xinitrc
cp -v .xinitrc ~/
chmod +x ~/.xinitrc

# .wallpaper
cp -v .wallpaper ~/
chmod +x ~/.wallpaper

# Install scripts
cp -r .local/bin/* $LOCALBINDIR
chmod +x $LOCALBINDIR/*

# Create a script to be run after logging out and back in
echo '#!/usr/bin/sh' > /home/$USER/run-me.sh
echo 'paru -S --noconfirm ttf-jetbrains-mono-nerd ttf-ms-win11-auto adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-emoji && paru -Rns --noconfirm gnu-free-fonts' >> /home/$USER/run-me.sh
echo 'echo "Done!!!"' >> /home/$USER/run-me.sh
echo 'rm /home/$USER/run-me.sh' >> /home/$USER/run-me.sh

chmod +x /home/$USER/run-me.sh
echo "Log out and back in, then run 'run-me.sh'"

exit
