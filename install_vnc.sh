#!/bin/bash

# Aktualisiere das Paketverzeichnis
sudo apt update

# Installiere den RealVNC Server
sudo apt install realvnc-vnc-server

# Starte den VNC Server, um die Konfiguration zu initialisieren
vncserver

# Stoppe den VNC Server
vncserver -kill :1

# Bearbeite die Konfigurationsdatei
echo "#!/bin/bash" > ~/.vnc/xstartup
echo "xrdb \$HOME/.Xresources" >> ~/.vnc/xstartup
echo "startxfce4 &" >> ~/.vnc/xstartup

# Setze die Berechtigungen für das Skript
chmod +x ~/.vnc/xstartup

# Erstelle eine systemd-Service-Datei
echo "[Unit]" | sudo tee /etc/systemd/system/vncserver.service > /dev/null
echo "Description=VNC Server" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "After=network.target" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "[Service]" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "Type=simple" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "ExecStart=/usr/bin/vncserver :1 -geometry 1280x800 -depth 16" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "ExecStop=/usr/bin/vncserver -kill :1" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "User=$(whoami)" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "Restart=always" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "[Install]" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
echo "WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null

# Aktiviere den systemd-Service
sudo systemctl enable vncserver.service

# Starte den VNC-Server-Service
sudo systemctl start vncserver.service

# Ausgabe der Statusmeldung
echo "Die Installation des RealVNC-Servers und die Konfiguration des systemd-Dienstes wurden abgeschlossen."

