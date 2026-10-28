TARGET := iphone:clang:latest:15.0
THEOS_PACKAGE_SCHEME = rootless
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DuoDock

DuoDock_FILES = Tweak.x
DuoDock_CFLAGS = -fobjc-arc
DuoDock_FRAMEWORKS = UIKit CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += DuoDockPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
