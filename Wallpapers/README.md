## Add additional wallpapers to Ubuntu

## Ubuntu 18.04

https://askubuntu.com/questions/116494/how-can-i-add-more-wallpapers

I think it's in /usr/share/backgrounds.

just make a ~/Pictures/wallpapers and make a link from /usr/share/wallpapers to that folder, so then they'll appear as
a subfolder in the wallpaper selection, and you won't have to enter the root password every time. that might help

ln -s ~/Pictures/wallpapers /usr/share/wallpapers