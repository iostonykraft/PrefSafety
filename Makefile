export ARCHS = armv7 armv7s arm64
export TARGET = iphone:clang
export SDKVERSION = 7.0


include theos/makefiles/common.mk

TWEAK_NAME = PrefSafety
PrefSafety_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
include $(THEOS_MAKE_PATH)/aggregate.mk
