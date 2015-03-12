//
//  AppDelegate.m
//  TaifunoDemo
//
//  Created by Artem Olkov on 11/10/14.
//  Copyright (c) 2014 taifuno. All rights reserved.
//

#import "AppDelegate.h"
#import "TFTaifuno.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[TFTaifuno sharedInstance] setApiKey:@"3fd03d3cc4ce455b9530f63c49ee1781"];
    
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
            // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:
                                                       (UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil]];
        [application registerForRemoteNotifications];
    } else {
            // iOS < 8 Notifications
        [application registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    return YES;
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSString *newToken = [deviceToken description];
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"My token is: %@", newToken);
    [[TFTaifuno sharedInstance] registerDeviceToken:newToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if ([userInfo[@"origin"] isEqualToString:@"Taifuno"])
        [[TFTaifuno sharedInstance] didRecieveNewNotification:userInfo];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[TFTaifuno sharedInstance] saveTaifuno];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

@end
