include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FuckNewTabsPreferences
FuckNewTabsPreferences_FILES = NZFRootListController.m
FuckNewTabsPreferences_INSTALL_PATH = /Library/PreferenceBundles
FuckNewTabsPreferences_FRAMEWORKS = UIKit
FuckNewTabsPreferences_PRIVATE_FRAMEWORKS = Preferences
FuckNewTabsPreferences_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FuckNewTabsPreferences.plist$(ECHO_END)
