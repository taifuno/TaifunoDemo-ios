//
//  AppDelegate.m
//  TaifunoDemo
//
//  Created by Artem Olkov on 11/10/14.
//  Copyright (c) 2014 taifuno. All rights reserved.
//

#import "AppDelegate.h"
#import <taifunoLibrary/TFTaifuno.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[TFTaifuno sharedInstance] setApiKey:@"b9d0d6f617414b6da419ce1d43c7d8d9"];
    
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
            // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil]];
        
        [application registerForRemoteNotifications];
    }
    else
    {
            // iOS < 8 Notifications
        [application registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
        // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSString *newToken = [deviceToken description];
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"My token is: %@", newToken);
    [[TFTaifuno sharedInstance] registerDeviceToken:newToken];
}

@end
