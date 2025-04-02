# Media Controls Applet

This is a media control applet built using **YAD (Yet Another Dialog)**. It provides a simple interface to control your media playback.

## Features
- **Play/Pause**: Toggle playback of your media.
- **Next/Previous**: Skip to the next or previous track.
- **Album Cover Display**: Shows the album cover of the currently playing track.

## Requirements
- YAD (Yet Another Dialog)
- A compatible media player with MPRIS support (e.g., VLC, MPV, Spotify, etc.)

## Installation
```bash
# Clone the repo
git clone https://github.com/ondrejhonus/media-controls-applet

# Create a scripts folder
mkdir ~/.config/icewm/scripts

# Move the file to the scripts folder
mv media-controls-applet/media-controls.sh ~/.config/icewm/scripts

# Make executable
chmod +x ~/.config/icewm/scripts/media-controls.sh

# Add the script to the startup file
echo "exec ~/.config/icewm/scripts/media-controls.sh &" >> ~/.config/icewm/startup
```