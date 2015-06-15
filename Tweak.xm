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
	return FALSE; 
}

- (BOOL)_toggleSettingsBadge {
	return FALSE; 
}

%end

%hook ResetPrefController

- (void)popupViewDidAppear:(BOOL)arg1 {
	NO;
}

- (void)eraseSettings:(id)arg1 {
	NO;
}

- (void)eraseSettingsAndContent:(id)arg1 {
	NO;
}

- (void)confirmationSpecifierConfirmed:(id)arg1 {
	NO; 
}

- (void)didAcceptEnteredPIN:(id)arg1 {
	NO; 
}

%end