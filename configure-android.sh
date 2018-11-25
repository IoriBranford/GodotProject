#!/bin/sh
set -e

DEBUG_KEYSTORE="$(find $(pwd) -name debug.keystore)"
RELEASE_KEYSTORE="$(find $(pwd) -name release.keystore)"

sed -i -r \
	-e "s#(keystore/release=).+#\1\"$RELEASE_KEYSTORE\"#" \
	-e "s#(keystore/release_user=).+#\1\"$KEYSTORE_USERNAME\"#" \
	-e "s#(keystore/release_password=).+#\1\"$KEYSTORE_PASSWORD\"#" export_presets.cfg

sed -i -r \
	-e "s#(export/android/adb = ).+#\1\"$(which adb)\"#" \
	-e "s#(export/android/jarsigner = ).+#\1\"$(which jarsigner)\"#" \
	-e "s#(export/android/debug_keystore = ).+#\1\"$DEBUG_KEYSTORE\"#" editor_settings-3.tres

cp editor_settings-3.tres ~/.config/godot/
