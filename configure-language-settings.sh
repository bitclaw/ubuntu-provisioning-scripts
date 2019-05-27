#!/bin/bash

# Set language bar to switch between English and Spanish
gsettings get org.gnome.desktop.input-sources sources
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'latam')]"