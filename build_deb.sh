#!/usr/bin/env bash
set -ex

SDK_PATH=$(xcrun --sdk iphoneos --show-sdk-path)

echo "[*] Step 1: Compiling DuoDock.dylib..."
xcrun -sdk iphoneos clang -arch arm64 \
    -target arm64-apple-ios15.0 \
    -miphoneos-version-min=15.0 \
    -dynamiclib \
    -isysroot "$SDK_PATH" \
    -framework UIKit \
    -framework Foundation \
    -framework CoreGraphics \
    -framework QuartzCore \
    -undefined dynamic_lookup \
    -fobjc-arc \
    Tweak.m -o DuoDock.dylib

echo "[*] Step 2: Compiling DuoDockPrefs bundle binary..."
mkdir -p build_bundle
xcrun -sdk iphoneos clang -arch arm64 \
    -target arm64-apple-ios15.0 \
    -miphoneos-version-min=15.0 \
    -bundle \
    -isysroot "$SDK_PATH" \
    -framework UIKit \
    -framework Foundation \
    -framework CoreGraphics \
    -undefined dynamic_lookup \
    -fobjc-arc \
    DuoDockPrefs/DuoDockRootListController.m -o build_bundle/DuoDockPrefs

echo "[*] Step 3: Signing binaries with ldid..."
ldid -S DuoDock.dylib
ldid -S build_bundle/DuoDockPrefs

echo "[*] Step 4: Preparing Rootless package structure..."
rm -rf pkg_root
mkdir -p pkg_root/var/jb/Library/MobileSubstrate/DynamicLibraries
mkdir -p pkg_root/var/jb/Library/PreferenceLoader/Preferences
mkdir -p pkg_root/var/jb/Library/PreferenceBundles/DuoDockPrefs.bundle
mkdir -p pkg_root/DEBIAN

# Copy Tweak dylib + filter plist
cp DuoDock.dylib pkg_root/var/jb/Library/MobileSubstrate/DynamicLibraries/
cp DuoDock.plist pkg_root/var/jb/Library/MobileSubstrate/DynamicLibraries/

# Direct native PreferenceLoader plist with all specifiers
cp Preferences/DuoDock.plist pkg_root/var/jb/Library/PreferenceLoader/Preferences/

# Copy PreferenceBundle
cp build_bundle/DuoDockPrefs pkg_root/var/jb/Library/PreferenceBundles/DuoDockPrefs.bundle/
cp DuoDockPrefs/Resources/Info.plist pkg_root/var/jb/Library/PreferenceBundles/DuoDockPrefs.bundle/
cp DuoDockPrefs/Resources/Root.plist pkg_root/var/jb/Library/PreferenceBundles/DuoDockPrefs.bundle/

# Debian control
cp control pkg_root/DEBIAN/control

# Set exact Unix permissions
chmod -R 0755 pkg_root
chmod 0644 pkg_root/DEBIAN/control

echo "[*] Step 5: Packaging with dpkg-deb..."
dpkg-deb -Zgzip --root-owner-group -b pkg_root DuoDock_rootless.deb

rm -rf pkg_root build_bundle DuoDock.dylib
echo "[+] Hoàn tất! File DuoDock_rootless.deb đã được tạo thành công."
