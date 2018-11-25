# Godot Sample Project

Fork this project to start a new Godot game with autobuilds via GitLab CI.

Godot version: 3.0.6

Platforms:

- Windows desktop
- Mac OSX
- Linux X11
- Android

## Android release signing

1. Generate `release.keystore`, replacing the one included here. Example from https://developer.android.com/studio/publish/app-signing#signing-manually
```
keytool -genkey -v -keystore release.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias YOUR_ALIAS
```
> This example prompts you for passwords for the keystore and key, and to provide the Distinguished Name fields for your key. It then generates the keystore as a file...saving it in the current directory (you can move it wherever you'd like). The keystore contains a single key that is valid for 10,000 days.

2. In your project page Settings > CI/CD > Variables, add the variables `KEYSTORE_ALIAS` and `KEYSTORE_PASSWORD`. Set them to your keystore's alias and password.