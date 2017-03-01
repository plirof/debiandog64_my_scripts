export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194"
xhost +
su - puppy -c "/usr/bin/chromium  --user-data-dir=/home/puppy/chromium_puppy_user_data_dir --disk-cache-dir=/home/puppy/chromium_puppy_user_data_dir/.cache  --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194 --always-authorize-plugins"
