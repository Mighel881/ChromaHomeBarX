THEOS_DEVICE_IP = 192.168.0.10
THEOS_PACKAGE_DIR_NAME = debs

TARGET = iphone:clang
ARCHS = armv7 armv7s arm64

#TARGET = simulator:clang::5.0
#ARCHS = x86_64 i386
# i386 slice is required for 32-bit iOS Simulator (iPhone 5, etc.)
DEBUG = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ChromaHomeBarX
ChromaHomeBarX_FILES = ChromaHomeBarX.xm
ChromaHomeBarX_FRAMEWORKS = UIKit QuartzCore
ChromaHomeBarX_CFLAGS = -fobjc-arc -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"