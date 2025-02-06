#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(VitaleSDKBridge, RCTEventEmitter)

RCT_EXTERN_METHOD(startSDK:(NSString *)appID
                  password:(NSString *)password
                  userID:(NSString *)userID
                  url:(NSString *)url)

RCT_EXTERN_METHOD(setMainColor:(NSString *)color)
RCT_EXTERN_METHOD(setPrimaryButtonColor:(NSString *)color)
RCT_EXTERN_METHOD(setNavigationBarColor:(NSString *)color)
RCT_EXTERN_METHOD(setNavigationTintColor:(NSString *)color)

RCT_EXTERN_METHOD(showVitale)
RCT_EXTERN_METHOD(showNutrition)
RCT_EXTERN_METHOD(setCountry:(NSInteger)country)
RCT_EXTERN_METHOD(showTraining)
RCT_EXTERN_METHOD(showTodaytraining)
RCT_EXTERN_METHOD(showLibrary)
RCT_EXTERN_METHOD(showCustomWorkouts)
RCT_EXTERN_METHOD(showTimeBasedWorkouts)
RCT_EXTERN_METHOD(showProfile)

RCT_EXTERN_METHOD(updatePersonalProfile:(NSDictionary *)profile)
RCT_EXTERN_METHOD(setPathologies:(NSArray *)pathologies)

RCT_EXTERN_METHOD(getProfile:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end
