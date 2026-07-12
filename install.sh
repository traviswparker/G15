#/bin/bash
sudo apt install build-essential g15daemon libg15-dev libg15daemon-client-dev libg15render-dev libgtop2-dev xorg-dev -y || exit
tar -xvf g15stats.tar.gz
pushd g15stats 
./install.sh || exit
popd
rm -rf g15stats
tar -xvf g15macro.tar.gz
pushd g15macro
./install.sh || exit
popd
rm -rf g15macro
sudo cp -v g15daemon.service /usr/lib/systemd/system/
sudo cp -v g15stats.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl restart g15daemon
sudo systemctl enable --now g15stats
sudo cp -v g15macro.desktop /etc/xdg/autostart
