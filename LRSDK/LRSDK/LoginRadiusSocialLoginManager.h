//
//  LoginRadiusSocialLoginManager.h
//
//  Copyright © 2016 LoginRadius Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRadiusSDK.h"

@interface LoginRadiusSocialLoginManager : NSObject
@property BOOL useNativeLogin;

+ (instancetype)instanceWithApplication:(UIApplication*)application launchOptions:(NSDictionary*)launchOptions;
+ (instancetype)sharedInstance;

-(void)loginWithProvider:(NSString*)provider
			inController:(UIViewController*)controller
	   completionHandler:(loginResult)handler;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
@end
