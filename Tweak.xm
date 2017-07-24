#import <Cephei/HBPreferences.h>

static HBPreferences *settings;

static void nz9_prefChanged() {
  if (settings) {
    [settings release];
  }
  settings = [[HBPreferences  alloc] initWithIdentifier:@"com.neinzedd9.FuckNewTabs"];
  [settings registerDefaults:@{
      @"enableSwitch": @YES,
  }];
}

static BOOL nz9_isTweakEnabled() {
  return [settings boolForKey:@"enableSwitch"];
}


@interface BrowserToolbar : UIView

@property (copy) UIToolbar *replacementToolbar;

@end

%hook BrowserToolbar

- (void)setAddTabEnabled:(BOOL)arg1 {
	if(nz9_isTweakEnabled()) {
		%orig(NO);
	}
	else {
		%orig;
	}
}

- (void)layoutSubviews {
	%orig;
	if(nz9_isTweakEnabled()) {
		[[self.replacementToolbar.items objectAtIndex:2] setEnabled:NO];
	}
	else {
		[[self.replacementToolbar.items objectAtIndex:2] setEnabled:YES];
	}
}

%end




%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)nz9_prefChanged, CFSTR("NZ9FuckNewTabsPreferencesChangedNotification"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	%init;
	nz9_prefChanged();
}
