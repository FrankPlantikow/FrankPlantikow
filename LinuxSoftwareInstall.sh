#!/bin/bash

# Update und Upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Installiere benötigte Pakete
sudo apt-get install -y \
  git-all \
  build-essential \
  python3 \
  python-is-python3 \
  python3-doc \
  gparted \
  chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra \
  arduino \
  fritzing fritzing-parts \
  openshot-qt openshot-qt-doc \
  vlc vlc-l10n vlc-plugin-fluidsynth vlc-plugin-jack libxvidcore4 libfaac0 \
  inkscape \
  dia libwmf-bin pstoedit sketch \
  gimp gimp-help-de language-pack-gnome-de dcraw ufraw-batch gimp-gap gimp-gutenprint \
  gimp-plugin-registry \
  scribus scribus-doc scribus-template \
  icc-profiles \
  hugin enblend \
  onedrive \
  x11vnc \
  vnc4server vnc-java \
  xfonts-base \
  htop \
  neofetch \
  gnome-system-monitor \
  conky

# Herunterladen von Visual Studio Code
wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
# Installation von Visual Studio Code
sudo dpkg -i vscode.deb
sudo apt-get install -f
# Löschen der heruntergeladenen Datei
rm vscode.deb

# Konfiguriere x11vnc
sudo x11vnc -storepasswd 123456789 /etc/x11vnc.pass --yes
sudo x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/myuser/.vnc/passwd -rfbport 5900 -shared --yes

