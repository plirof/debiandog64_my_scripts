export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194"
xhost +
su - puppy -c "firejail /usr/bin/chromium  --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=24.0.0.194 --always-authorize-plugins"
