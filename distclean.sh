#!/bin/sh
#
# Remove Packages directory and generated files
#
. ./config.sh
./clean.sh
exec rm -rf Package.resolved Package.pins Packages Sources/Gtk/${Module}.swift Sources/Gtk/Swift${Mod}.swift ${Mod}.xcodeproj
