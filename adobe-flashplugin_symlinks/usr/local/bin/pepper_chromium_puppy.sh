export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.221"
xhost +
su - puppy -c "/usr/bin/chromium  --user-data-dir=/home/puppy/chromium_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.221"
