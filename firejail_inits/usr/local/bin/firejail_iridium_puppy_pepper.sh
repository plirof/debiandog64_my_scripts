export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194"
xhost +
#su - puppy -c "iridium-browser  --user-data-dir=/home/puppy/iridium_puppy_user_data_dir"
su - puppy -c "firejail iridium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194 --always-authorize-plugins"
