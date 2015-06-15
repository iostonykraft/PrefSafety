#import <SBSoftwareUpdateController.h>
#import <Preferences/Preferences.h>
#import <ResetPrefController.h>
#import <SoftwareUpdatePrefController.h>


%hook SoftwareUpdatePrefController

- (id)init {
	return NULL; 
}

%end

%hook SBSoftwareUpdateController

- (BOOL)_isSettingsBadgedForSoftwareUpdate {
	return NO; 
}

- (BOOL)_toggleSettingsBadge {
	return NO; 
}

%end

%hook ResetPrefController

- (void)popupViewDidAppear:(BOOL)arg1 {
	%orig(FALSE);
}

- (void)eraseSettings:(id)arg1 {
	%orig(NULL);
}

- (void)eraseSettingsAndContent:(id)arg1 {
	%orig(NULL);
}

- (void)confirmationSpecifierConfirmed:(id)arg1 {
	NO; 
}

- (void)didAcceptEnteredPIN:(id)arg1 {
	%orig(NULL); 
}

%end