include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FuckNewTabs
FuckNewTabs_FILES = Tweak.xm
FuckNewTabs_EXTRA_FRAMEWORKS += Cephei CepheiPrefs


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += fucknewtabspreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
