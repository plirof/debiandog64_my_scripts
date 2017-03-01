ln -s ../../adobe-flashplugin/libflashplayer.so ./libflashplayer.so
ln -s ../../adobe-flashplugin/libpepflashplayer.so ./libpepflashplayer.so


#su - puppy -c "iridium-browser --user-data-dir=/home/puppy/irid_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=23.0.0.207"
#su - puppy -c "/usr/share/iron/chrome-wrapper  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=23.0.0.207"
#adobe-flashplugin                                            24.0.0.194