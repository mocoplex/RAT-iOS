//
//  AppDelegate.m
//  ADLIBrRATSample
//
//  Created by mocoplex on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "AppDelegate.h"
#import <ADLIBrRAT/ALTracker.h>


#define ADLIB_RAT_KEY @"INSERT_YOUR_RAT_KEY"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // Optional: set debug mode
    [[ALTracker sharedSingletonClass] setDebugMode:YES];
    
    // RAT Tracker initialize the install tracking. Replace with your app ID (ex. 560255520cf25399f0221e72)
    [[ALTracker sharedSingletonClass] initialize:ADLIB_RAT_KEY];
    
    return YES;
}

@end
