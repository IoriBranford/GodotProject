#!/bin/sh
set -e

set_property() {
	FILE=$1
	KEY=$2
	VALUE=$3
	if [ ! -z $VALUE ]
	then
		sed -i -r -e "s#(${KEY}\s*=\s*).+#\1\"${VALUE}\"#" ${FILE}
	fi
}

DEBUG_KEYSTORE="$(find $(pwd) -name debug.keystore)"
RELEASE_KEYSTORE="$(find $(pwd) -name release.keystore)"
set_property export_presets.cfg keystore/release $RELEASE_KEYSTORE
set_property export_presets.cfg keystore/release_user $KEYSTORE_USERNAME
set_property export_presets.cfg keystore/release_password $KEYSTORE_PASSWORD
set_property editor_settings-3.tres export/android/debug_keystore $DEBUG_KEYSTORE

set_property editor_settings-3.tres export/windows/rcedit $(which rcedit-x64.exe)
set_property editor_settings-3.tres export/windows/wine $(which wine)
set_property editor_settings-3.tres export/android/adb $(which adb)
set_property editor_settings-3.tres export/android/jarsigner $(which jarsigner)

cp editor_settings-3.tres ~/.config/godot/
