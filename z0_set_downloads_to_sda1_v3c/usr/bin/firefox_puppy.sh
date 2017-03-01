#env CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=23.0.0.207"
#xhost +
mkdir -p /mnt/sda1/downloads_linux/.data/firefox
#mkdir -p /mnt/sda1/downloads_linux/.cache/pale
cp -n /usr/bin/firefox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/firefox/prefs.js
firefox-esr -profile "/mnt/sda1/downloads_linux/.data/firefox"
#su - puppy -c "/usr/share/iron/chrome-wrapper  --user-data-dir=/mnt/sda1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iron"
