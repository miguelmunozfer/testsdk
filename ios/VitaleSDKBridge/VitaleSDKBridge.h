#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface VitaleSDKBridge : RCTEventEmitter <RCTBridgeModule>

- (void)startSDK:(NSString *)appID password:(NSString *)password userID:(NSString *)userID url:(NSString *)url;
- (void)setMainColor:(NSString *)color;
- (void)setPrimaryButtonColor:(NSString *)color;
- (void)setNavigationBarColor:(NSString *)color;
- (void)setNavigationTintColor:(NSString *)color;

- (void)showVitale;
- (void)showNutrition;
- (void)setCountry:(NSInteger)country;
- (void)showTraining;
- (void)showTodaytraining;
- (void)showLibrary;
- (void)showCustomWorkouts;
- (void)showTimeBasedWorkouts;
- (void)showProfile;

- (void)updatePersonalProfile:(NSDictionary *)profile;
- (void)setPathologies:(NSArray *)pathologies;
- (void)getProfile:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject;

@end 