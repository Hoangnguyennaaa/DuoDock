TARGET := iphone:clang:latest:15.0
THEOS_PACKAGE_SCHEME = rootless
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DuoDockPrefs

DuoDockPrefs_FILES = DuoDockRootListController.m
DuoDockPrefs_FRAMEWORKS = UIKit CoreGraphics
DuoDockPrefs_PRIVATE_FRAMEWORKS = Preferences
DuoDockPrefs_INSTALL_PATH = /Library/PreferenceBundles
DuoDockPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
