//
//  LoginRadiusFacebookLogin.h
//
//  Copyright © 2016 LoginRadius Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRadiusSDK.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface LoginRadiusFacebookLogin : NSObject
+ (instancetype)sharedInstance;
+ (instancetype)instanceWithApplication:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions;
- (void)loginfromViewController:(UIViewController*)controller handler:(loginResult)handler;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
@end
