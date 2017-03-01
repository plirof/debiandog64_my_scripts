#env CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194"
xhost +
mkdir -p /mnt/sda1/downloads_linux/.data/slim
mkdir -p /mnt/sda1/downloads_linux/.cache/slim
sudo chown root:root /usr/opt/slimjet/slimjet-sandbox
sudo chmod 4755 /usr/opt/slimjet/slimjet-sandbox
#su - puppy -c "/usr/share/iron/chrome-wrapper  --user-data-dir=/mnt/sda1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iron"
su - puppy -c "/usr/bin/flashpeak-slimjet --user-data-dir=/mnt/sda1/downloads_linux/.data/slim --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/slim --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194 --always-authorize-plugins"
