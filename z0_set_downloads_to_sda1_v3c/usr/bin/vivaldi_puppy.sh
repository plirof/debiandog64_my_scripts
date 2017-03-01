export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194"
xhost +
#su - puppy -c "iridium-browser  --user-data-dir=/home/puppy/iridium_puppy_user_data_dir"
mkdir -p /mnt/sda1/downloads_linux/.data/viva
mkdir -p /mnt/sda1/downloads_linux/.cache/viva
su - puppy -c "vivaldi-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194  --user-data-dir=/mnt/sda1/downloads_linux/.data/viva --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/viva --always-authorize-plugins"
