#env CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=23.0.0.207"
#xhost +
mkdir -p /mnt/sda1/downloads_linux/.data/palemoon
#mkdir -p /mnt/sda1/downloads_linux/.cache/pale
cp -n /usr/bin/palemoon_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/palemoon/prefs.js
palemoon -profile "/mnt/sda1/downloads_linux/.data/palemoon"
#su - puppy -c "/usr/share/iron/chrome-wrapper  --user-data-dir=/mnt/sda1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iron"
