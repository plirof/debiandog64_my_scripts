# might need $* instead of $@
xhost +
su - puppy -c "firejail $@"
