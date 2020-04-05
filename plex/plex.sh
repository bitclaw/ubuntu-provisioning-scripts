#!/bin/sh

#  See https://github.com/filebot/plex-agents

cd /var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/ || exit
wget https://github.com/filebot/plex-agents/archive/master.zip
unzip master.zip
cp -R plex-agents-master/Scanners/ ../Application\ Support/Plex\ Media\ Server/
cp -R /var/lib/plexmediaserver/Library/Application\ Support/plex-agents-master/Plug-ins/Xattr.bundle /var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/Plug-ins/
service plexmediaserver restart

# Next time will try this
# #!/bin/sh -xu
# curl -L -O https://github.com/filebot/plex-agents/archive/master.zip
# unzip -o master.zip
# cp -vru 'plex-agents-master/Plug-ins' '/path/to/PlexMediaServer/Library/Plex Media Server'
# cp -vru 'plex-agents-master/Scanners' '/path/to/PlexMediaServer/Library/Plex Media Server'
