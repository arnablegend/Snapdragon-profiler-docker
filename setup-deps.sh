set -ex
sudo apt-get --yes --allow-unauthenticated install openssh-client sshpass
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update 
sudo apt-get --yes --allow-unauthenticated install mono-devel

#Install other deps
sudo apt-get --yes --allow-unauthenticated install gtk-sharp2 libc++1

#ADB deps
wget https://dl.google.com/android/repository/platform-tools_r29.0.5-linux.zip
unzip platform-tools_r29.0.5-linux.zip
sudo mv platform-tools /opt/
rm platform-tools_r29.0.5-linux.zip
cd /opt/platform-tools

sudo ln -sf /opt/platform-tools/adb /usr/bin/adb
sudo ln -sf /opt/platform-tools/dmtracedump /usr/bin/dmtracedump
sudo ln -sf /opt/platform-tools/e2fsdroid /usr/bin/e2fsdroid
sudo ln -sf /opt/platform-tools/etc1tool /usr/bin/etc1tool
sudo ln -sf /opt/platform-tools/fastboot /usr/bin/fastboot
sudo ln -sf /opt/platform-tools/hprof-conv /usr/bin/hprof-conv
sudo ln -sf /opt/platform-tools/make_f2fs /usr/bin/make_f2fs
sudo ln -sf /opt/platform-tools/mke2fs /usr/bin/mke2fs
sudo ln -sf /opt/platform-tools/sqlite3 /usr/bin/sqlite3
sudo ln -sf /opt/platform-tools/sload_f2fs /usr/bin/sload_f2fs
