#!/bin/bash

# Check for updates
softwareupdate -i -a

# Empty trash can
rm -rf ~/.Trash

# Clear system cache
sudo rm -rf /Library/Caches/*
sudo rm -rf /tmp/*

# Clear browser cache
for browser in "Safari" "Chrome" "Firefox" "Opera"; do
    ~/Applications/$browser/Contents/MacOS/$browser --clear-cache
done

# Check disk for errors
diskutil verifyvolume /

# Run App Store updates
mas upgrade

# Force daily, weekly, monthly cleaning
sudo periodic daily weekly monthly

# Wait for the user to press enter
read -n 1

# Restart the computer
sudo shutdown -r now
