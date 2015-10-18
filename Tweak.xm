#import <SBSoftwareUpdateController.h>
#import <Preferences/Preferences.h>
#import <ResetPrefController.h>
#import <SoftwareUpdatePrefController.h>

#define PLIST_PATH @"/User/Library/Preferences/com.tonykraft.prefsafety.plist"

inline bool GetPrefBool(NSString *key) {
    bool defaultValueWhenPreferenceIsMissing = true;
    NSNumber *preferenceValue = [[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key];

    if (!preferenceValue) {
        return defaultValueWhenPreferenceIsMissing;
    }
    return [preferenceValue boolValue];
}


%hook SoftwareUpdatePrefController

- (id)init {
	return NULL; 
}

- (void)scanForUpdate {
	
}

- (void)alertView:(id)arg1 clickedButtonAtIndex:(long long)arg2 {
	
}

- (void)setDownload:(id)arg1 {
	
}

- (id)download {
	return NULL;
}

%end

%hook SBSoftwareUpdateController

- (BOOL)_isSettingsBadgedForSoftwareUpdate {
	return FALSE; 
}

- (BOOL)_toggleSettingsBadge {
	return FALSE; 
}

%end

%hook ResetPrefController

- (void)popupViewDidAppear:(BOOL)arg1 {
	if (GetPrefBool(@"reset")) arg1=NO;
	%orig;
}

- (void)eraseSettings:(id)arg1 {
	if (GetPrefBool(@"reset")) arg1=nil;
	%orig;
}

- (void)eraseSettingsAndContent:(id)arg1 {
	if (GetPrefBool(@"reset")) arg1=nil;
	%orig;
}

- (void)confirmationSpecifierConfirmed:(id)arg1 {
	if (GetPrefBool(@"reset")) arg1=nil;
	%orig;
}

- (void)didAcceptEnteredPIN:(id)arg1 {
	if (GetPrefBool(@"reset")) arg1=nil;
	%orig;
}

%end

%hook PSSoftwareUpdateTableView

- (id)initWithFrame:(CGRect)arg1 style:(long long)arg2 {
	return nil;
}

%end

%hook PSUIResetPrefController

- (id)init {
	if (GetPrefBool(@"reset")) return nil;
	return %orig;
}

%end

%hook PreferenceAppController

- (void)updateSoftwareUpdateBadgeOnSpecifier:(id)arg1 {
	if (GetPrefBool(@"badge")) arg1=nil;
	%orig;
}

%end